

import UIKit

class LoginViewContoller: UIViewController, UITextFieldDelegate {
    //set test account ID/password
    let ID = "frank21649"
    let password = "0000"
    
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorStatusLabel: UILabel!
    
    
    @IBAction func pressLogin(sender: UIButton) {
        //check ID/password
        if idTextfield.text == "frank21649" && passwordTextfield.text == "0000"{
            performSegueWithIdentifier("showHome", sender: nil)
        }else if idTextfield.text == "" || passwordTextfield.text == ""{
            errorStatusLabel.text = "please enter ID and password"
            errorStatusLabel.hidden = false
        }else{
            errorStatusLabel.text = "ID or password not correct"
            errorStatusLabel.hidden = false
        }
    }
    
    //resign keyboard when return pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        idTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        self.idTextfield.delegate = self
        self.passwordTextfield.delegate = self
    }
    
    
    

}


class ForgotPasswordViewController: UIViewController{
    let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginVC")
    
    @IBAction func backButton(sender: UIBarButtonItem) {
        self.presentViewController(loginVC, animated: true, completion: nil)
    }
    @IBAction func sendViaText(sender: UIButton) {
        self.presentViewController(loginVC, animated: true, completion: nil)
    }
    @IBAction func sendViaEmail(sender: UIButton) {
        self.presentViewController(loginVC, animated: true, completion: nil)
    }
    
}