//
//  ViewControllerPregunta.swift
//  CulturaVisual
//
//  Created by Maggie Jimenez Herrera on 11/1/19.
//  Copyright © 2019 Maggie Jimenez Herrera. All rights reserved.
//

import UIKit

class ViewControllerPregunta: UIViewController {

    //Creacion de variables
    @IBOutlet weak var bt1: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet weak var bt4: UIButton!
    @IBOutlet weak var lbNum: UILabel!
    @IBOutlet weak var lbPregunta: UILabel!
    @IBOutlet weak var lbPreg: UILabel!
    @IBOutlet weak var lbTimer: UILabel!
    
    var preCorrectas = 0
    var seconds = 30
    var timer = Timer()
    var cont = 0
    var listaPreguntas : [String]!
    var listaRespuestas : [String]!
    var listaRespuestas2 : [String]!
    var res1 = 0
    var res2 = 1
    var res3 = 2
    var res4 = 3
    
    override func viewDidLoad() {
           super.viewDidLoad()
           setUpLayout()
        newQuestion()
       }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    
    //Funcion para que las respuestas esten en diferente orden
    func nombreBt() {
        
        //Agarra un elemento al azar y despues lo borra del arreglo para que no se repitan respuestas
        var randAnwser = listaRespuestas2.randomElement()
        bt1.setTitle(randAnwser, for: .normal)
        if let index = listaRespuestas2.firstIndex(of: randAnwser!){
            listaRespuestas2.remove(at: index)
        }
        randAnwser = listaRespuestas2.randomElement()
        bt2.setTitle(randAnwser, for: .normal)
        if let index = listaRespuestas2.firstIndex(of: randAnwser!){
            listaRespuestas2.remove(at: index)
        }
        randAnwser = listaRespuestas2.randomElement()
        bt3.setTitle(randAnwser, for: .normal)
        if let index = listaRespuestas2.firstIndex(of: randAnwser!){
                   listaRespuestas2.remove(at: index)
        }
        bt4.setTitle(listaRespuestas2[0], for: .normal)
    }

    @IBAction func seleccionar(_ sender: Any) {
        timer.invalidate()
        let respuestabt = bt2.currentTitle
        var resCorrecta : String!
        
        //Checa cual es la respuesta correcta de la pregunta
        switch cont {
        case 0:
            resCorrecta = listaRespuestas[res1]
            break;
        case 1:
            resCorrecta = listaRespuestas[res2]
            break;
        case 2:
            resCorrecta = listaRespuestas[res3]
            break;
        default:
            resCorrecta = listaRespuestas[res4]
            break;
        }
        //Compara la respuesta del boton seleccionado con la respuesta correcta
        if respuestabt == resCorrecta{
            preCorrectas += 1
            bt2.layer.backgroundColor = UIColor.green.withAlphaComponent(0.5).cgColor
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
        else{
            bt2.layer.backgroundColor = UIColor.red.withAlphaComponent(0.5).cgColor
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
        bt1.isEnabled = false
        bt2.isEnabled = false
        bt3.isEnabled = false
        bt4.isEnabled = false
        
        //Delay para mostrar la siguiente pregunta
        print(cont)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.cont += 1
            self.bt1.isEnabled = true
            self.bt2.isEnabled = true
            self.bt3.isEnabled = true
            self.bt4.isEnabled = true
            print(self.cont)
            
//            print("Despues de 5 seg")
            if self.cont < 4 {
                self.newQuestion()
            }
            else{
                self.performSegue(withIdentifier: "resp4", sender: nil)
            }
        }
    }
    
    @IBAction func seleccionar2(_ sender: Any) {
        timer.invalidate()
        let respuestabt = bt1.currentTitle
        var resCorrecta : String!
        switch cont {
        case 0:
            resCorrecta = listaRespuestas[res1]
            break;
        case 1:
            resCorrecta = listaRespuestas[res2]
            break;
        case 2:
            resCorrecta = listaRespuestas[res3]
            break;
        default:
            resCorrecta = listaRespuestas[res4]
            break;
        }
        
        if respuestabt == resCorrecta{
            preCorrectas += 1
            bt1.layer.backgroundColor = UIColor.green.withAlphaComponent(0.5).cgColor
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
        else{
            bt1.layer.backgroundColor = UIColor.red.withAlphaComponent(0.5).cgColor
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
        bt1.isEnabled = false
        bt2.isEnabled = false
        bt3.isEnabled = false
        bt4.isEnabled = false
        
//        print("Antes")
       
       print(cont)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.cont += 1
            self.bt1.isEnabled = true
            self.bt2.isEnabled = true
            self.bt3.isEnabled = true
            self.bt4.isEnabled = true
            print(self.cont)
//            print("Despues de 5 seg")
            if self.cont < 4 {
                self.newQuestion()
            }
            else{
                self.performSegue(withIdentifier: "resp4", sender: nil)
            }
        }
    }
    
    
    @IBAction func seleccionar3(_ sender: Any) {
        timer.invalidate()
        let respuestabt = bt3.currentTitle
        var resCorrecta : String!
        switch cont {
        case 0:
            resCorrecta = listaRespuestas[res1]
            break;
        case 1:
            resCorrecta = listaRespuestas[res2]
            break;
        case 2:
            resCorrecta = listaRespuestas[res3]
            break;
        default:
            resCorrecta = listaRespuestas[res4]
            break;
        }
        
        if respuestabt == resCorrecta{
            preCorrectas += 1
            bt3.layer.backgroundColor = UIColor.green.withAlphaComponent(0.5).cgColor
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
        else{
            bt3.layer.backgroundColor = UIColor.red.withAlphaComponent(0.5).cgColor
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
        bt1.isEnabled = false
        bt2.isEnabled = false
        bt3.isEnabled = false
        bt4.isEnabled = false
        //Delay
       print(cont)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.cont += 1
            self.bt1.isEnabled = true
            self.bt2.isEnabled = true
            self.bt3.isEnabled = true
            self.bt4.isEnabled = true
            print(self.cont)
            if self.cont < 4 {
                self.newQuestion()
            }
            else{
                self.performSegue(withIdentifier: "resp4", sender: nil)
            }
        }
    }
    
    @IBAction func seleccionar4(_ sender: Any) {
        timer.invalidate()
        let respuestabt = bt4.currentTitle
        var resCorrecta : String!
        switch cont {
        case 0:
            resCorrecta = listaRespuestas[res1]
            break;
        case 1:
            resCorrecta = listaRespuestas[res2]
            break;
        case 2:
            resCorrecta = listaRespuestas[res3]
            break;
        default:
            resCorrecta = listaRespuestas[res4]
            break;
        }

        if respuestabt == resCorrecta{
            preCorrectas += 1
            bt4.layer.backgroundColor = UIColor.green.withAlphaComponent(0.5).cgColor
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
        else{
            bt4.layer.backgroundColor = UIColor.red.withAlphaComponent(0.5).cgColor
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
        bt1.isEnabled = false
        bt2.isEnabled = false
        bt3.isEnabled = false
        bt4.isEnabled = false
        print(cont)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.bt1.isEnabled = true
            self.bt2.isEnabled = true
            self.bt3.isEnabled = true
            self.bt4.isEnabled = true
            print(self.cont)
            self.cont += 1
            if self.cont < 4 {
                self.newQuestion()
            }
            else{
                self.performSegue(withIdentifier: "resp4", sender: nil)
            }
        }
    }
    
    @objc func counter(){
        seconds -= 1
        lbTimer.text = String(seconds)
        
        if seconds == 0{
            if cont < 3{
                cont += 1
                timer.invalidate()
                newQuestion()
            }
            else{
                self.performSegue(withIdentifier: "resp1", sender: nil)
                timer.invalidate()
            }
            
        }
        
    }
    
    func newQuestion(){
        seconds = 30
        lbTimer.text = String(seconds)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        listaPreguntas = ["Cuanto es 2 + 2", "Cuanto es 3 + 3?", "Cuanto es 4 * 4?", "Cuanto es 5 - 3?"]
        listaRespuestas = ["4", "6", "16", "2"]
        listaRespuestas2 = ["4", "6", "16", "2"]
        lbPregunta.text = listaPreguntas[cont]
        lbNum.text = "\(cont + 1)"
        nombreBt()
        bt1.layer.backgroundColor = UIColor.clear.cgColor
        bt2.layer.backgroundColor = UIColor.clear.cgColor
        bt3.layer.backgroundColor = UIColor.clear.cgColor
        bt4.layer.backgroundColor = UIColor.clear.cgColor
        bt1.layer.cornerRadius = 5
        bt1.layer.borderWidth = 3
        bt1.layer.borderColor = UIColor.black.cgColor
        bt2.layer.cornerRadius = 5
        bt2.layer.borderWidth = 3
        bt2.layer.borderColor = UIColor.black.cgColor
        bt3.layer.cornerRadius = 5
        bt3.layer.borderWidth = 3
        bt3.layer.borderColor = UIColor.black.cgColor
        bt4.layer.cornerRadius = 5
        bt4.layer.borderWidth = 3
        bt4.layer.borderColor = UIColor.black.cgColor
    }
    
    
    //Checa que no haga el segue si aun no pasan todas las preguntas
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if cont <= 3{
            return false
        }
        return true
            
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaRes = segue.destination as! ViewControllerResultado
        vistaRes.preCorrectas = preCorrectas
    }
    
    //MARK:- Constrains
    //====================================================
    func setUpLayout(){
        
    lbNum.translatesAutoresizingMaskIntoConstraints = false
    lbPreg.translatesAutoresizingMaskIntoConstraints = false
    lbPregunta.translatesAutoresizingMaskIntoConstraints = false
    bt1.translatesAutoresizingMaskIntoConstraints = false
    bt2.translatesAutoresizingMaskIntoConstraints = false
    bt3.translatesAutoresizingMaskIntoConstraints = false
    bt4.translatesAutoresizingMaskIntoConstraints = false
        lbTimer.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Constrains del label Preg
        lbPreg.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
    lbPreg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //Constrains label cont
        lbNum.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        lbNum.leftAnchor.constraint(equalTo: lbPreg.rightAnchor, constant: 20).isActive = true
        
        //Constrains del label pregunta
        lbPregunta.topAnchor.constraint(equalTo: lbPreg.bottomAnchor, constant: 15).isActive = true
        lbPregunta.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        lbPregunta.widthAnchor.constraint(equalToConstant: 263).isActive = true
        lbPregunta.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        //Constrains del boton 1
        bt1.topAnchor.constraint(equalTo: lbPregunta.bottomAnchor, constant: 20).isActive = true
        bt1.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        bt1.widthAnchor.constraint(equalToConstant: 143).isActive = true
        bt1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        //Constrains del boton 2
        bt2.topAnchor.constraint(equalTo: lbPregunta.bottomAnchor, constant: 20).isActive = true
        bt2.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
    bt2.widthAnchor.constraint(equalToConstant: 143).isActive = true
    bt2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //Constrains del boton 3
        bt3.topAnchor.constraint(equalTo: bt1.bottomAnchor, constant: 20).isActive = true
        bt3.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        bt3.widthAnchor.constraint(equalToConstant: 143).isActive = true
        bt3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //Constrains del boton 4
        bt4.topAnchor.constraint(equalTo: bt2.bottomAnchor, constant: 20).isActive = true
        bt4.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
        bt4.widthAnchor.constraint(equalToConstant: 143).isActive = true
        bt4.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //Constrains del timer
        lbTimer.topAnchor.constraint(equalTo: bt4.bottomAnchor, constant: 40).isActive = true
        lbTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    

}
