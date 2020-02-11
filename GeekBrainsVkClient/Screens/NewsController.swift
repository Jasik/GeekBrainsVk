//
//  NewsController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/31.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class NewsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let news: [News] = [
          News(avatar: "b01", author: "Bred Pitt", date: "2020-01-31", contentText: "You’ll notice a new state attribute called @GestureState.", image: ["m1"]),
          News(avatar: "b02", author: "Rogozhkin Vladimir", date: "2020-01-31", contentText: "You’ll notice a new state attribute called @GestureState. This attribute enables the state of a gesture to be stored and read during a gesture in order to influence the effects that gesture may have on the drawing of the view. This property will be used to record whether the card has been pressed for a long time or not, and will be reset when the gesture is completed, unlike @State property wrappers which will not be reset when a gesture has ended.", image: ["m1", "m2"]),
          News(avatar: "b03", author: "Jonny Pitt", date: "2020-01-31", contentText: "You’ll notice a new state attribute called @GestureState. This attribute enables the state of a gesture to be stored and read during a gesture in order to influence the effects that gesture may have on the drawing of the view. ", image: ["m1", "m2", "m3"]),
          News(avatar: "j01", author: "Johny Depp", date: "2020-01-31", contentText: "You’ll notice a new state attribute called @GestureState. This attribute enables the state of a gesture to be stored and read during a gesture in order to influence the effects that gesture may have on the drawing of the view. This property will be used to record whether the card has been pressed for a long time or not, and will be reset when the gesture is completed, unlike @State property wrappers which will not be reset when a gesture has ended.", image: ["m1", "m2", "m3", "m1"]),
          News(avatar: "j03", author: "Rogozhkin Vladimir", date: "2020-01-31", contentText: "You’ll notice a new state attribute called @GestureState. This attribute enables the state of a gesture to be stored and read during a gesture in order to influence the effects that gesture may have on the drawing of the view. This property will be used to record whether the card has been pressed for a long time or not, and will be reset when the gesture is completed, unlike @State property wrappers which will not be reset when a gesture has ended.", image: ["m1", "m2", "m3", "m1", "m2", "m3"])
      ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "News"
        setupTable()
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        
        tableView.registerXib(cellClass: NewsCell.self)
    }
}

extension NewsController: UITableViewDelegate { }

extension NewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.className, for: indexPath) as? NewsCell else {
            fatalError()
        }
        let oneNews = news[indexPath.row]
        cell.news = oneNews
        cell.commentButtomConnection = {
            self.showAlert(title: "Кнопка Комментарий.", message: "Эта функция пока не доступна")
        }
        cell.shareButtonConnection = {
            self.showAlert(title: "Кнопка Поделиться.", message: "Эта функция пока не доступна")
        }
        return cell
    }
}
extension NewsController {
    private func showAlert(title: String, message: String) {
        let alertControllert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alertControllert.addAction(action)
        present(alertControllert, animated: true, completion: nil)
    }
}
