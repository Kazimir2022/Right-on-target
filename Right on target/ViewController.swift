//
//  ViewController.swift
//  Right on target
//
//  Created by Kazimir on 26.01.23.
//

import UIKit

class ViewController: UIViewController {
    // Сущность "Игра"
    var game: Game!
    // Элементы на сцене
    @IBOutlet var slider:UISlider!
    @IBOutlet var label:UILabel!
    
  
    // MARK: - Жизненный цикл
    override func loadView (){
        super.loadView()
print("loadView ViewController")
    }
    
   
    override func viewDidLoad(){
        super.viewDidLoad()
print("viewDidLoad ViewController")
        // Создаем экземпляр сущности "Игра"
                game = Game(startValue: 1, endValue: 50, rounds: 5)
                // Обновляем label о текущем значении загаданного числа
                updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        
    }
   
    override func viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
print("viewWillAppear ViewController")
    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
print("viewDidAppear ViewController")
    }
    override func viewWillDisappear(_ animated:Bool){
        super.viewWillDisappear(animated)
print("viewWillDisappear ViewController")
    }
    
    // MARK: - Взаимодействие View - Model
        
        // Проверка выбранного пользователем числа
    @IBAction func checkNumber() {
        // Высчитываем очки за раунд
                game.calculateScore(with: Int(slider.value))
                // Проверяем, окончена ли игра
                if game.isGameEnded {
                    showAlertWith(score: game.score)
                    // Рестартуем игру
                    game.restartGame()
                } else {
                    game.startNewRound()
                }
                // Обновляем данные о текущем значении загаданного числа
                updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
            }

   // MARK: - Обновление View
   
   // Обновление текста загаданного числа
   private func updateLabelWithSecretNumber(newText: String ) {
       label.text = newText
   }
   
   // Отображение всплывающего окна со счетом
   private func showAlertWith( score: Int ) {
       let alert = UIAlertController(
                       title: "Игра окончена",
                       message: "Вы заработали \(score) очков",
                       preferredStyle: .alert)
       alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
       self.present(alert, animated: true, completion: nil)
   }

}

