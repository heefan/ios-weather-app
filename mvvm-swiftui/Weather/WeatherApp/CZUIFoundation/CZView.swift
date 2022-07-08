//
//  CZView.swift
//  WeatherApp
//
//  Created by litian on 7/7/22.
//

import SwiftUI

protocol CZViewProtocol {
    associatedtype ViewModelT
    var viewModel: ViewModelT! { get set }
}

extension View {
 
    public static func make<T: CZViewProtocol>(view: T.Type, viewModel: T.ViewModelT) -> T {
        view.viewModel = viewModel
        return view
    }
}
