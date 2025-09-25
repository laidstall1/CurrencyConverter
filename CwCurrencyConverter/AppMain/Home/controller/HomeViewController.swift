//
//  ViewController.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 20/09/2025.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIStackView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var firstRateTF: CurrencyField!
  @IBOutlet weak var secondRateTF: CurrencyField!
  @IBOutlet weak var firstCurrencyField: CurrencyPickerField!
  @IBOutlet weak var secondCurrencyField: CurrencyPickerField!
  @IBOutlet weak var currencyToggleBtn: UIButton!
  @IBOutlet weak var exchangeRateTimeBtn: UIButton!
  @IBOutlet weak var exchangeRateTimeView: UIView!
  @IBOutlet weak var bottomGraphView: UIView!
  @IBOutlet weak var convertButton: PrimaryActionButton!
  
  var viewModel: HomeViewModel
  
  private let firstCurrencyPickerView = UIPickerView()
  private let secondCurrencyPickerView = UIPickerView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    viewModelBindings()
    apiGetRateRequest()
  }
  
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    let dts = RateDataSourceImpl(apiKey: AppConfig.apiKey,
                                 realmManager: RealmManager())
    viewModel = HomeViewModel(dataSource: dts)
    super.init(coder: coder)
  }
  
  fileprivate func apiGetRateRequest() {
    Task {
      await viewModel.getRate()
      self.updateUI()
    }
  }
  
  fileprivate func viewModelBindings() {
    viewModel.errorMessage
      .receive(on: DispatchQueue.main)
      .sink { error in
        guard let error = error else { return }
        AlertHelper.showErrorAlert(message: error, vc: self)
      }
      .store(in: &viewModel.subscriptions)
    
    viewModel.isLoading
      .receive(on: DispatchQueue.main)
      .sink { [weak self] isLoading in
        self?.showLoadingView(status: isLoading)
    }
    .store(in: &viewModel.subscriptions)
  }
  
  fileprivate func updateUI() {
    let baseCurrency = viewModel.rates?.base
    [firstRateTF, secondRateTF].forEach { $0?.currency = baseCurrency ?? "" }
    [firstCurrencyField, secondCurrencyField].forEach { $0.text = baseCurrency }
    setupChartView()
  }
  
  @IBAction func convertAction(_ sender: Any) {
    secondRateTF.text = String(viewModel.selectedCurrencyRate ?? 0)
  }
  
  fileprivate func handleTitleLabelAttribute() {
    if let text = titleLabel.text, !text.isEmpty {
      let nsRange = NSRange(location: text.count - 1, length: 1)
      let attributed = NSMutableAttributedString(string: text)
      attributed.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: nsRange)
      titleLabel.attributedText = attributed
    }
  }
  
  fileprivate func setupTextFieldPickerView() {
    secondCurrencyField.inputView = secondCurrencyPickerView
    secondCurrencyPickerView.delegate = self
    addDoneToolbarToCurrencyFields()
  }
  
  fileprivate func addDoneToolbarToCurrencyFields() {
    [firstCurrencyField, secondCurrencyField].forEach {
      $0.inputAccessoryView = view.addDoneToolbar(selector: #selector(donePressed), target: self)
    }
  }
  
  private func setupChartView() {
    let tabView = TabView(data: ["Past 30 days", "Past 90 days"])
    bottomGraphView.addSubview(tabView)
    tabView.anchor(top: bottomGraphView.topAnchor, paddingTop: 30)
    tabView.centerXInSuperview()
    let rates = viewModel.rates?.rates ?? [:]
    let chartView = RatesChartUIView(rates: rates)
    bottomGraphView.addSubview(chartView)
    chartView.anchor(
      top: tabView.bottomAnchor,
      left: bottomGraphView.leftAnchor,
      right: bottomGraphView.rightAnchor,
      paddingTop: 20, paddingLeft: 20, paddingRight: 20
    )
    let bottomBtn = UIButton.createButtonWithUnderlinedText("Get rate alerts straight to your email inbox", textColor: .white)
    bottomGraphView.addSubview(bottomBtn)
    bottomBtn.anchor(bottom: bottomGraphView.bottomAnchor, paddingBottom: 40)
    bottomBtn.centerXInSuperview()
  }
  
  private func setupView() {
    handleTitleLabelAttribute()
    exchangeRateTimeBtn.titleLabel?.underline()
    exchangeRateTimeBtn.titleLabel?.textColor = .link
    let informationIconBtn = UIImageView(image: UIImage(systemName: "info.circle.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal))
    informationIconBtn.setDimensions(height: 20, width: 20)
    exchangeRateTimeView.addSubview(informationIconBtn)
    informationIconBtn.anchor(left: exchangeRateTimeBtn.rightAnchor, paddingLeft: 4)
    informationIconBtn.cornerRadius = 10
    informationIconBtn.centerY(inView: exchangeRateTimeBtn)
    informationIconBtn.backgroundColor = .link
    [firstRateTF, secondRateTF, firstCurrencyField, secondCurrencyField].forEach { $0?.numbersOnly() }
    firstCurrencyField.alpha = 0.5
    setupTextFieldPickerView()
    convertButton.disable()
  }
}

extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
  var currencyKeys: [String] {
    return viewModel.rates?.rates?.keys.sorted() ?? []
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return currencyKeys.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return currencyKeys[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let selectedCurrency = currencyKeys[row]
    let rate = viewModel.rates?.rates?[selectedCurrency] ?? 0.0
    debugPrint("Selected: \(selectedCurrency) = \(rate)")
    viewModel.selectedCurrency = selectedCurrency
  }
}

// Actions
extension HomeViewController {
  @objc
  func donePressed() {
    secondCurrencyField.text = viewModel.selectedCurrency
    secondRateTF.currency = viewModel.selectedCurrency ?? ""
    secondRateTF.text = String()
    convertButton.enable()
    secondCurrencyField.resignFirstResponder()
  }
}
