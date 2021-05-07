//
//  ContentView.swift
//  Shared
//
//  Created by Spencer Lee on 4/2/21.
//


import SwiftUI
import CorePlot

typealias plotDataType = [CPTScatterPlotField : Double]

struct ContentView: View {
    @EnvironmentObject var plotDataModel :PlotDataClass
    @ObservedObject private var calculator = CalculatePlotData()
    @State var isChecked:Bool = false
    @State var popInput = "500"
    @State var alphaInput = ".005"
    @State var betaInput = ".0095"
    @State var zetaInput = ".0001"
    @State var deltaInput = ".0001"
    @State var growthInput = "0"
    @State var zguessInput = "1"
    @State var rhoInput = ".005"
    @State var gammaInput = ".005"
    @State var sigmaInput = ".005"
    @State var kappaInput = ".005"
    @State var dayInput = "50"
    @State var cInput = ".0095"
    @State var killInput = ".05"
    @State var attackInput = "1"
    
    var plotSelect = ["Total Population: Basic Model", "Susceptible population S: Basic Model", "Zombie Population Z: Basic Model", "Removed Population R: Basic Model", "Total Population: Latent Model", "Susceptible population S: Model With Latent Infection", "Zombie Population Z: Model With Latent Infection", "Removed Population R: Model With Latent Infection", "Infected Not Necessarily Zombie Yet Population for Latent Model", "Total Population: Qurantine", "Susceptible population S: Quarantine Model", "Zombie Population Z: Quarantine Model", "Removed Population R: Quarantine Model","Infected not yet Zombies: Quarantine Model", "Quarantine Population", "Total Population: Cure Model", "Susceptible population S: Model With Cure", "Zombie Population Z: Model With Cure", "Removed Population R: Model With Cure", "Infected Population for Cure Model", "Total Population: Eradication Model", "Susceptible population S: Eradication Model", "Zombie Population Z: Eradication Model", "Removed Population R: Eradication Model"]
    
    
    
    
    @State private var selectedPlotIndex = 0
    

    var body: some View {
        
        VStack{
      
            CorePlot(dataForPlot: $plotDataModel.plotData, changingPlotParameters: $plotDataModel.changingPlotParameters)
                .setPlotPadding(left: 10)
                .setPlotPadding(right: 10)
                .setPlotPadding(top: 10)
                .setPlotPadding(bottom: 10)
                .padding()
            
            Divider()
            
            HStack{
                
                HStack(alignment: .center) {
                    Text("Population:")
                        .font(.callout)
                        .bold()
                    TextField("500", text: $popInput)
                        .padding()
                    Text("Alpha:")
                        .font(.callout)
                        .bold()
                    TextField("0.005", text: $alphaInput)
                        .padding()
                    Text("Beta:")
                        .font(.callout)
                        .bold()
                    TextField("0.0095", text: $betaInput)
                        .padding()
                    Text("Zeta:")
                        .font(.callout)
                        .bold()
                    TextField("0.0001", text: $zetaInput)
                        .padding()
                    Text("Delta:")
                        .font(.callout)
                        .bold()
                    TextField("0.0001", text: $deltaInput)
                        .padding()
                    
                }.padding()
                
//                Toggle(isOn: $isChecked) {
//                            Text("Display Error")
//                        }
//                .padding()
                
                
            }
            HStack{
                Picker(selection: $selectedPlotIndex, label: Text(""))
                    { ForEach(0 ..< plotSelect.count) { Text(self.plotSelect[$0])
                    }
                }
//                Text("Selected Population: (plotSelect[selectedPlotIndex])")
//                .padding()
                
                
                Text("Growth Rate:")
                    .font(.callout)
                    .bold()
                TextField("0", text: $growthInput)
                    .padding()
                Text("Initial Zombie Number: ")
                    .font(.callout)
                    .bold()
                TextField("1", text: $zguessInput)
                    .padding()
                Text("Days: ")
                    .font(.callout)
                    .bold()
                TextField("50", text: $dayInput)
                    .padding()
                
                Text("Cure Parameter: ")
                    .font(.callout)
                    .bold()
                TextField("", text: $cInput)
                    .padding()
            }
            HStack{
                Button("Calculate", action: {self.calculate()} )
                .padding()
               
                Text("Rho: ")
                    .font(.callout)
                    .bold()
                TextField(".005", text: $rhoInput)
                    .padding()
                
                Text("Kappa: ")
                    .font(.callout)
                    .bold()
                TextField(".005", text: $kappaInput)
                    .padding()
                
                Text("Gamma: ")
                    .font(.callout)
                    .bold()
                TextField(".005", text: $gammaInput)
                    .padding()
                
                Text("Sigma: ")
                    .font(.callout)
                    .bold()
                TextField(".005", text: $sigmaInput)
                    .padding()
            
            }
            HStack{
                Text("Kill Ratio:")
                    .font(.callout)
                    .bold()
                TextField("", text: $killInput)
                    .padding()
                Text("Number of Attacks:")
                    .font(.callout)
                    .bold()
                TextField("", text: $attackInput)
                    .padding()
            }
        }
        
    }
    
    
    
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate(){
        
        let attack = Double(attackInput)!
        let kill = Double(killInput)!
        let see = Double(cInput)!
        let gam = Double(gammaInput)!
        let sig = Double(sigmaInput)!
        let kap = Double(kappaInput)!
        let row = Double(rhoInput)!
        let zgue = Double(zguessInput)!
        let pie = Double(growthInput)!
        let pop = Double(popInput)! - zgue
        let alpha = Double(alphaInput)!
        let beta = Double(betaInput)!
        let zeta = Double(zetaInput)!
        let delta = Double(deltaInput)!
        let days = Double(dayInput)!
            
        //pass the plotDataModel to the cosCalculator
        calculator.plotDataModel = self.plotDataModel
        
        //Calculate the new plotting data and place in the plotDataModel
         //calculator.basicModelPlotZ(Population: pop)
        let tempPopulationIndex = selectedPlotIndex
        
        switch tempPopulationIndex {
            
        case 0:
            calculator.basicModelPlotT(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        case 1:
                calculator.basicModelPlotS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        case 2:
        calculator.basicModelPlotZ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        case 3:
            calculator.basicModelPlotR(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        case 4:
            calculator.latentModelPlotT(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days)
        case 5:
            calculator.latentModelPlotS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days)
        case 6:
            calculator.latentModelPlotZ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days)
        case 7:
            calculator.latentModelPlotR(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days)
        case 8:
            calculator.latentModelPlotI(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days)
        case 9:
            calculator.quarantineModelT(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam, days: days)
        case 10:
            calculator.quarantineModelS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam, days: days)
        case 11:
            calculator.quarantineModelZ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam, days: days)
        case 12:
            calculator.quarantineModelR(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam, days: days)
        case 13:
            calculator.quarantineModelI(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam, days: days)
        case 14:
            calculator.quarantineModelQ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam, days: days)
        case 15:
            calculator.CureModelPlotT(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days, CureParameter: see)
        case 16:
            calculator.CureModelPlotS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days, CureParameter: see)
        case 17:
            calculator.CureModelPlotZ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days, CureParameter: see)
        case 18:
            calculator.CureModelPlotR(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days, CureParameter: see)
        case 19:
            calculator.CureModelPlotI(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, days: days, CureParameter: see)
        case 20:
            calculator.eradicationModelT(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days, KillRatio: kill, AttackNumber: attack)
        case 21:
            calculator.eradicationModelS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days, KillRatio: kill, AttackNumber: attack)
        case 22:
            calculator.eradicationModelZ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days, KillRatio: kill, AttackNumber: attack)
        case 23:
            calculator.eradicationModelR(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days, KillRatio: kill, AttackNumber: attack)
        
        default:
            calculator.basicModelPlotS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, days: days)
        }
    
        // end calculate function
    }
    

   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
