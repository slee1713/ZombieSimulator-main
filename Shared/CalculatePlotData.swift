//
//  CalculatePlotData.swift
//  SwiftUICorePlotExample
//
//  Created by Jeff Terry on 12/22/20.
//

import Foundation
import SwiftUI
import CorePlot

class CalculatePlotData: ObservableObject {
    
    var plotDataModel: PlotDataClass? = nil
    
    @ObservedObject var basicLocal = ModelEquations()

    func plotYEqualsX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
        plotDataModel!.changingPlotParameters.yMin = -5.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -5.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .red()
        plotDataModel!.changingPlotParameters.title = " y = x"
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        for i in 0 ..< 120 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = x


            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        
    }
    
    
    func ploteToTheMinusX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y = exp(-x)"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "exp(-x)"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        for i in 0 ..< 60 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = exp(-x)
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func basicModelPlotT(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double) {
        
        //
        let localY = basicLocal.BasicModelT(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Total population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "T vs days Basic Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func basicModelPlotS(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double) {
        
        //
        let localY = basicLocal.BasicModelS(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Susceptible population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "S vs days Basic Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    
    func basicModelPlotZ(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double){
        
        //
        let localY = basicLocal.BasicModelZ(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "Z vs days Basic Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func basicModelPlotR(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double){
        
        //
        let localY = basicLocal.BasicModelR(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Removed population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "R vs days Basic Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func latentModelPlotT(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double){
        
        //
        let localY = basicLocal.LatentInfectionModelT(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Total population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "T vs days Latent Infection Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func latentModelPlotS(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double){
        
        //
        let localY = basicLocal.LatentInfectionModelS(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Susceptible population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "S vs days Latent Infection Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func latentModelPlotZ(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double){
        
        //
        let localY = basicLocal.LatentInfectionModelZ(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "Z vs days Latent Infection Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func latentModelPlotR(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double){
        
        //
        let localY = basicLocal.LatentInfectionModelR(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Removed population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "R vs days Latent Infection Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func latentModelPlotI(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double){
        
        //
        let localY = basicLocal.LatentInfectionModelI(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Infected Not Yet Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "I vs days Latent Infection Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func quarantineModelT(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double ){
        
        //
        let localY = basicLocal.QuarantineModelT(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, kappa: kappa, sigma: sigma, gamma: gamma, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Total population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "T vs days Quarantine Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func quarantineModelS(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double ){
        
        //
        let localY = basicLocal.QuarantineModelS(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, kappa: kappa, sigma: sigma, gamma: gamma, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Susceptible population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "S vs days Quarantine Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }

    func quarantineModelZ(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double ){
        
        //
        let localY = basicLocal.QuarantineModelZ(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, kappa: kappa, sigma: sigma, gamma: gamma, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "Z vs days Quarantine Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }

    func quarantineModelR(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double ){
        
        //
        let localY = basicLocal.QuarantineModelR(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, kappa: kappa, sigma: sigma, gamma: gamma, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Removed population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "R vs days Quarantine Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }

    func quarantineModelI(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double ){
        
        //
        let localY = basicLocal.QuarantineModelI(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, kappa: kappa, sigma: sigma, gamma: gamma, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Infected Not Yet Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "I vs days Quarantine Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }

    
    
    func quarantineModelQ(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double ){
        
        //
        let localY = basicLocal.QuarantineModelQ(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, kappa: kappa, sigma: sigma, gamma: gamma, days: days)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Quarantine population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "Q vs days Quarantine Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func CureModelPlotT(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double){
        
        //
        let localY = basicLocal.CureModelT(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days, CureParameter: CureParameter)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Total population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "T vs days Cure Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
  }

    func CureModelPlotS(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double){
        
        //
        let localY = basicLocal.CureModelS(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days, CureParameter: CureParameter)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Susceptible population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "S vs days Cure Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func CureModelPlotZ(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double){
        
        //
        let localY = basicLocal.CureModelZ(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days, CureParameter: CureParameter)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "Z vs days Cure Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func CureModelPlotR(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double){
        
        //
        let localY = basicLocal.CureModelR(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days, CureParameter: CureParameter)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Removed population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "R vs days Cure Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func CureModelPlotI(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double){
        
        //
        let localY = basicLocal.CureModelI(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: rho, days: days, CureParameter: CureParameter)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Infected Not Yet Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "I vs days Cure Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func eradicationModelT(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double, KillRatio: Double, AttackNumber: Double) {
        
        //
        let localY = basicLocal.EradicationModelT(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days, KillRatio: KillRatio, AttackNumber: AttackNumber)
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Total population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "T vs days Eradication Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func eradicationModelS(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double, KillRatio: Double, AttackNumber: Double) {
        
        //
        let localY = basicLocal.EradicationModelS(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days, KillRatio: KillRatio, AttackNumber: AttackNumber)
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Susceptible population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "S vs days Eradication Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    func eradicationModelZ(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double, KillRatio: Double, AttackNumber: Double) {
        
        //
        let localY = basicLocal.EradicationModelZ(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days, KillRatio: KillRatio, AttackNumber: AttackNumber)
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "Z vs days Eradication Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func eradicationModelR(Population: Double,InitialZombieNumber: Double,  GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double, KillRatio: Double, AttackNumber: Double) {
        
        //
        let localY = basicLocal.EradicationModelR(Population: Population, InitialZombieNumber: InitialZombieNumber, GrowthRate: GrowthRate, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days, KillRatio: KillRatio, AttackNumber: AttackNumber)
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "days"
        plotDataModel!.changingPlotParameters.yLabel = "Removed population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "R vs days Erradication Model"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
}



