
import UIKit


//1.プロトコル（手段、特定の部品を操る能力）を追加
class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate  {
    
    @IBOutlet weak var myPicekerView: UIPickerView!
    
    
    
    //データを配列で用意する
    var teaList = ["ダージリン","アールグレイ","アッサム","オレンジペコ"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //5.指示を出しているのがViewControllerだと知らせる設定
        // self:自分自身（ViewContrllerのこと）
        //データソース（表示するデータの設定指定する人）
        myPicekerView.dataSource = self
        
        //デリゲート（感知したイベントを委任する人、代理人（店長））
        myPicekerView.delegate = self
    }
    
    
    //2.ピッカービューの配列を決定する
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //1列に指定
    }
    
    //3.ピッカービューの行数を決定する
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teaList.count //４行に指定
    }
    
    
    //4.ピッカービューに表示する文字の設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //今ピッカービューが何行目のデータを作ろうとしているのか
        
        return teaList[row]
    }
    
    //(6.)選択された項目をデバッグエリアに表示
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // row:選択された項目が何行目か
        
        print(teaList[row])
        
        let alert = UIAlertController(title: "紅茶選択", message: "これにしちゃう？", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OK押されました")}))
        
        present(alert, animated: true, completion: {() -> Void in print("アラートが表示されました") })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

