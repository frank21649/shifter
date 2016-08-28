

import UIKit

class LoginViewContoller: UIViewController {
    @IBAction func pressLogin(sender: UIButton) {
        performSegueWithIdentifier("showHome", sender: nil)
    }

}


class ForgotPasswordViewController: UIViewController{
    @IBAction func backButton(sender: UIBarButtonItem) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginVC")
        self.presentViewController(loginVC, animated: true, completion: nil)
    }
}