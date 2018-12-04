//
//  ViewController.swift
//  Practica3
//
//  Created by I104-21 on 04/09/18.
//  Copyright © 2018 I104-21. All rights reserved.
//

import UIKit
//3.-extender/implementar metodos

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    //5.-Identificar fuentes de informacion
    
    var nombres = ["Yola","Diego"]
    var cal=["100","90"]
    let Rnom=["Diego","Saul","Monica","Angelica","Angel","Jose"]
    let Rcal=["100","90","80","70","60","50"]

    
    // @IBOutlet weak var nom: UITextField!
    //@IBOutlet weak var cali: UITextField!
    //1.-Generar Outler
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //2.-Conectar protocolos
        tableview.dataSource = self
        tableview.delegate=self
        
    }
    @IBAction func agrega(_ sender: UIButton) {
        let ra = Int (arc4random() % 6)
        self.nombres.insert(Rnom[ra], at:0)
        self.cal.insert(Rcal[ra], at:0)
        let indexPath = IndexPath(row:0,section:0)
        //suponemos que tenemos accesible la tabla, la necesitamos
        tableview.insertRows(at: [indexPath],
                         with: UITableViewRowAnimation.fade)
         
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //4.-Implementar metodos
    //secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //filas por seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //adaptar el numero de filas
        return nombres.count
    }
    //celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda=tableview.dequeueReusableCell(withIdentifier: "celda")
        celda?.textLabel?.text=nombres  [indexPath.row]
        celda?.detailTextLabel?.text=cal[indexPath.row]
        return celda!
        
    }
    
    //Extra
    //Identificar el evento de selección de una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Hola \(nombres[indexPath.row])", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle==UITableViewCellEditingStyle.delete{
            nombres.remove(at: indexPath.row)
            cal.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
  /*  @IBAction func add(_ sender: UIButton) {
        if((nom.text?.isEmpty)!||(cali.text?.isEmpty)!){
            let alert = UIAlertController(title: "Error", message: "Llena los 2 campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        }else{
            //nombres[3]=(nom.text)!
            //cal[3]=(cali.text)!
            tableview.reloadData()
        }
    }
    */
   
    
    
}

