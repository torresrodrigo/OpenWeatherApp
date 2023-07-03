//
//  ContentViewModel.swift
//  OpenWeatherApp
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import OpenWeatherAppCore
import Combine

class ContentViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    var useCase = GetCurrentWeatherUseCase()
    @Published var data: GetCurrentWeatherResponse?
    
    init() {
        setupBindings()
    }
    
    @MainActor
    func fetchData() async {
        try? await useCase.execute()
    }
    
    private func setupBindings() {
        useCase.currentLocation
            .receive(on: DispatchQueue.main)
            .sink { value in
                self.data = value
            }.store(in: &cancellables)
    }
}

