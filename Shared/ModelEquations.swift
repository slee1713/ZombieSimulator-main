//
//  ModelEquations.swift
//  ZombieSimulator
//
//  Created by Spencer Lee on 4/2/21.
//

import Foundation
import SwiftUI
import CorePlot

class ModelEquations: ObservableObject {
    let alpha = 0.005
    let beta = 0.0095
    let zeta = 0.0001
    let delta = 0.0001
    let step = 1.0
    let Pie = 20.0
    let time = 50.0
   
    func BasicModelT(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double) -> [Double] {
        
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        
        
        
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        totalPopulation.append(sS[0])
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(sS[n] * zZ[n] * beta + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n])
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1Z.append(zZ[n] + zPrime[n] * dX)
//            y1Z.append(k1Z[n] * dX / 2 + zZ[n])
            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
        }
        

        //return (y1S)
        
        return (totalPopulation)
        
    }
    func BasicModelS(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double) -> [Double] {
        
            
            var sPrime: [Double] = []
            var zPrime: [Double] = []
            var rPrime: [Double] = []
            var sS: [Double] = []
            var zZ: [Double] = []
            var rR: [Double] = []
            var dX = step
            var k1S: [Double] = []
            var y1S: [Double] = []
            var totalPopPrime: [Double] = []
            var totalPopulation: [Double] = []
            
            
            
            sPrime.append(0.0)
            zPrime.append(0.0)
            rPrime.append(0.0)
            sS.append(Population)
            zZ.append(InitialZombieNumber)
            rR.append(0.0)
            var n = 0
            totalPopulation.append(sS[0])
            
            for _ in stride(from: 0, through: days, by: dX) {
                
                let newsSValue = sS[n] + sPrime[n] * dX
                if(newsSValue > 0){
                    sS.append(newsSValue)
                }
                else{
                    
                    
                    sS.append(0.0)
                }
                let newzZValue = zZ[n] + zPrime[n] * dX
                if(newzZValue > 0){
                    zZ.append(newzZValue)
                }
                else{
                    
                    zZ.append(0.0)
                }
                let newrRValue = rR[n] + rPrime[n] * dX
                if(newrRValue > 0){
                    rR.append(newrRValue)
                }
                else{
                    
                    rR.append(0.0)
                }
                
    //            sS.append(sS[n] + sPrime[n] * dX)
    //            zZ.append(zZ[n] + zPrime[n] * dX)
    //            rR.append(rR[n] + rPrime[n] * dX)
                totalPopPrime.append(GrowthRate)
                totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
                sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
                zPrime.append(sS[n] * zZ[n] * beta + zeta * rR[n] - alpha * sS[n] * zZ[n])
                rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n])
                
    //            k1S.append(sS[n] + sPrime[n] * dX)
    //            y1S.append(k1S[n] * dX / 2 + sS[n])
    //
    //            k1Z.append(zZ[n] + zPrime[n] * dX)
    //            y1Z.append(k1Z[n] * dX / 2 + zZ[n])
                
                n += 1
                
                if(newzZValue > totalPopulation[n-1]){
                    break
                }
            }
            

            //return (y1S)
            
            return (sS)
    }
     
    func BasicModelZ(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double) -> [Double] {
        
            
            var sPrime: [Double] = []
            var zPrime: [Double] = []
            var rPrime: [Double] = []
            var sS: [Double] = []
            var zZ: [Double] = []
            var rR: [Double] = []
            var dX = step
            var k1S: [Double] = []
            var y1S: [Double] = []
            var totalPopPrime: [Double] = []
            var totalPopulation: [Double] = []
            
            
            
            sPrime.append(0.0)
            zPrime.append(0.0)
            rPrime.append(0.0)
            sS.append(Population)
            zZ.append(InitialZombieNumber)
            rR.append(0.0)
            var n = 0
            totalPopulation.append(sS[0])
            
            for _ in stride(from: 0, through: days, by: dX) {
                
                let newsSValue = sS[n] + sPrime[n] * dX
                if(newsSValue > 0){
                    sS.append(newsSValue)
                }
                else{
                    
                    
                    sS.append(0.0)
                }
                let newzZValue = zZ[n] + zPrime[n] * dX
                if(newzZValue > 0){
                    zZ.append(newzZValue)
                }
                else{
                    
                    zZ.append(0.0)
                }
                let newrRValue = rR[n] + rPrime[n] * dX
                if(newrRValue > 0){
                    rR.append(newrRValue)
                }
                else{
                    
                    rR.append(0.0)
                }
                
    //            sS.append(sS[n] + sPrime[n] * dX)
    //            zZ.append(zZ[n] + zPrime[n] * dX)
    //            rR.append(rR[n] + rPrime[n] * dX)
                totalPopPrime.append(GrowthRate)
                totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
                sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
                zPrime.append(sS[n] * zZ[n] * beta + zeta * rR[n] - alpha * sS[n] * zZ[n])
                rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n])
                
    //            k1S.append(sS[n] + sPrime[n] * dX)
    //            y1S.append(k1S[n] * dX / 2 + sS[n])
    //
    //            k1Z.append(zZ[n] + zPrime[n] * dX)
    //            y1Z.append(k1Z[n] * dX / 2 + zZ[n])
                
                n += 1
                
                if(newzZValue > totalPopulation[n-1]){
                    break
                }
            }
            

            //return (y1S)
            
            return (zZ)
    }
    
    func BasicModelR(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double) -> [Double] {
        
            
            var sPrime: [Double] = []
            var zPrime: [Double] = []
            var rPrime: [Double] = []
            var sS: [Double] = []
            var zZ: [Double] = []
            var rR: [Double] = []
            var dX = step
            var k1S: [Double] = []
            var y1S: [Double] = []
            
        
        
            sPrime.append(0.0)
            zPrime.append(0.0)
            rPrime.append(0.0)
            sS.append(Population)
            zZ.append(InitialZombieNumber)
            rR.append(0.0)
            var n = 0
            
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
            
            for _ in stride(from: 0, through: days, by: dX) {
                
                let newsSValue = sS[n] + sPrime[n] * dX
                if(newsSValue > 0){
                    sS.append(newsSValue)
                }
                else{
                    
                    
                    sS.append(0.0)
                }
                let newzZValue = zZ[n] + zPrime[n] * dX
                if(newzZValue > 0){
                    zZ.append(newzZValue)
                }
                else{
                    
                    zZ.append(0.0)
                }
                let newrRValue = rR[n] + rPrime[n] * dX
                if(newrRValue > 0){
                    rR.append(newrRValue)
                }
                else{
                    
                    rR.append(0.0)
                }
                
    //            sS.append(sS[n] + sPrime[n] * dX)
    //            zZ.append(zZ[n] + zPrime[n] * dX)
    //            rR.append(rR[n] + rPrime[n] * dX)
                totalPopPrime.append(GrowthRate)
                totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
                sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
                zPrime.append(sS[n] * zZ[n] * beta + zeta * rR[n] - alpha * sS[n] * zZ[n])
                rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n])
                
    //            k1S.append(sS[n] + sPrime[n] * dX)
    //            y1S.append(k1S[n] * dX / 2 + sS[n])
    //
    //            k1Z.append(zZ[n] + zPrime[n] * dX)
    //            y1Z.append(k1Z[n] * dX / 2 + zZ[n])
                
                n += 1
                
                if(newzZValue > totalPopulation[n-1]){
                    break
                }
            }
            

            //return (y1S)
            
            return (rR)
    }
    
    func LatentInfectionModelT(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1R: [Double] = []
        var y1R: [Double] = []
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1R.append(rR[n] + rPrime[n] * dX)
//            y1R.append(k1R[n] * dX / 2 + rR[n])
            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (totalPopulation)
        
    }
    
    
    func LatentInfectionModelS(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1R: [Double] = []
        var y1R: [Double] = []
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1R.append(rR[n] + rPrime[n] * dX)
//            y1R.append(k1R[n] * dX / 2 + rR[n])
            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (sS)
        
    }
    
    func LatentInfectionModelZ(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1Z: [Double] = []
        var y1Z: [Double] = []
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
            
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1Z.append(zZ[n] + zPrime[n] * dX)
//            y1Z.append(k1Z[n] * dX / 2 + zZ[n])
            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
        }
        

        return (zZ)
        
    }
    
    func LatentInfectionModelR(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1R: [Double] = []
        var y1R: [Double] = []
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
       
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
            
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            
            
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1R.append(rR[n] + rPrime[n] * dX)
//            y1R.append(k1R[n] * dX / 2 + rR[n])
//
            n += 1
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (rR)
        
    }
    
    func LatentInfectionModelI(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1I: [Double] = []
        var y1I: [Double] = []
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            
            
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1I.append(iI[n] + iPrime[n] * dX)
//            y1I.append(k1I[n] * dX / 2 + iI[n])
//
            n += 1
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (iI)
        
    }
    
    func QuarantineModelT(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double) -> [Double] {
        
        var qPrime: [Double] = []
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var qQ: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1I: [Double] = []
        var y1I: [Double] = []
        
        qPrime.append(0.0)
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        qQ.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
            let newqQValue = qQ[n] + qPrime[n] * dX
            if(newqQValue > 0){
                qQ.append(newqQValue)
            }
            else{
                
                qQ.append(0.0)
            }
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
//            qQ.append(qQ[n] + qPrime[n] * dX)
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n] - kappa * iI[n] )
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - sigma * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n] + gamma * qQ[n])
            qPrime.append(kappa * iI[n] + sigma * zZ[n] - gamma * qQ[n])
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1I.append(iI[n] + iPrime[n] * dX)
//            y1I.append(k1I[n] * dX / 2 + iI[n])
            
            n += 1
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (totalPopulation)
        
    }
    
    func QuarantineModelS(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double) -> [Double] {
        
        var qPrime: [Double] = []
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var qQ: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1I: [Double] = []
        var y1I: [Double] = []
        
        qPrime.append(0.0)
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        qQ.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
            let newqQValue = qQ[n] + qPrime[n] * dX
            if(newqQValue > 0){
                qQ.append(newqQValue)
            }
            else{
                
                qQ.append(0.0)
            }
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
//            qQ.append(qQ[n] + qPrime[n] * dX)
            
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n] - kappa * iI[n] )
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - sigma * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n] + gamma * qQ[n])
            qPrime.append(kappa * iI[n] + sigma * zZ[n] - gamma * qQ[n])
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1I.append(iI[n] + iPrime[n] * dX)
//            y1I.append(k1I[n] * dX / 2 + iI[n])
            
            n += 1
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (sS)
        
    }

    func QuarantineModelZ(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double) -> [Double] {
        
        var qPrime: [Double] = []
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var qQ: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1Z: [Double] = []
        var y1Z: [Double] = []
        
        qPrime.append(0.0)
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        qQ.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
            let newqQValue = qQ[n] + qPrime[n] * dX
            if(newqQValue > 0){
                qQ.append(newqQValue)
            }
            else{
                
                qQ.append(0.0)
            }
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
//            qQ.append(qQ[n] + qPrime[n] * dX)
            
            
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n] - kappa * iI[n] )
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - sigma * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n] + gamma * qQ[n])
            qPrime.append(kappa * iI[n] + sigma * zZ[n] - gamma * qQ[n])
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1I.append(iI[n] + iPrime[n] * dX)
//            y1I.append(k1I[n] * dX / 2 + iI[n])
            
            n += 1
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (zZ)
        
    }

    func QuarantineModelR(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double) -> [Double] {
        
        var qPrime: [Double] = []
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var qQ: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1R: [Double] = []
        var y1R: [Double] = []
        
        qPrime.append(0.0)
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        qQ.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
            let newqQValue = qQ[n] + qPrime[n] * dX
            if(newqQValue > 0){
                qQ.append(newqQValue)
            }
            else{
                
                qQ.append(0.0)
            }
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
//            qQ.append(qQ[n] + qPrime[n] * dX)
            
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            
            
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n] - kappa * iI[n] )
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - sigma * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n] + gamma * qQ[n])
            qPrime.append(kappa * iI[n] + sigma * zZ[n] - gamma * qQ[n])
            
//            k1S.append(sS[n] + sPrime[n] * dX)
//            y1S.append(k1S[n] * dX / 2 + sS[n])
//
//            k1I.append(iI[n] + iPrime[n] * dX)
//            y1I.append(k1I[n] * dX / 2 + iI[n])
            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
        }
        

        return (rR)
        
    }

    
    
    
    func QuarantineModelI(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double) -> [Double] {
        
        var qPrime: [Double] = []
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var qQ: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1I: [Double] = []
        var y1I: [Double] = []
        
        qPrime.append(0.0)
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        qQ.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
            let newqQValue = qQ[n] + qPrime[n] * dX
            if(newqQValue > 0){
                qQ.append(newqQValue)
            }
            else{
                
                qQ.append(0.0)
            }
//            sS.append(sS[n] + sPrime[n] * dX)
//            zZ.append(zZ[n] + zPrime[n] * dX)
//            rR.append(rR[n] + rPrime[n] * dX)
//            iI.append(iI[n] + iPrime[n] * dX)
//            qQ.append(qQ[n] + qPrime[n] * dX)
            
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n] - kappa * iI[n] )
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - sigma * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n] + gamma * qQ[n])
            qPrime.append(kappa * iI[n] + sigma * zZ[n] - gamma * qQ[n])
            

            
            n += 1
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (iI)
        }

    func QuarantineModelQ(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, kappa: Double, sigma: Double, gamma: Double, days: Double) -> [Double] {
        
        var qPrime: [Double] = []
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var qQ: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
                
        qPrime.append(0.0)
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        qQ.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }
            let newqQValue = qQ[n] + qPrime[n] * dX
            if(newqQValue > 0){
                qQ.append(newqQValue)
            }
            else{
                
                qQ.append(0.0)
            }

            
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            
            
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n] - kappa * iI[n] )
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - sigma * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n] + gamma * qQ[n])
            qPrime.append(kappa * iI[n] + sigma * zZ[n] - gamma * qQ[n])
            

            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
        }
        

        return (qQ)
        
    }
    
    func CureModelT(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }

            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n] + CureParameter * zZ[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - CureParameter * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            

            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (totalPopulation)
        
    }
    func CureModelS(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }

            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n] + CureParameter * zZ[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - CureParameter * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            

            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (sS)
        
    }

    func CureModelZ(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }

            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n] + CureParameter * zZ[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - CureParameter * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            

            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (zZ)
        
    }
    func CureModelR(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step

        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }

            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n] + CureParameter * zZ[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - CureParameter * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            

            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (rR)
        
    }
    func CureModelI(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, rho: Double, days: Double, CureParameter: Double) -> [Double] {
        
        var iPrime: [Double] = []
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var iI: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        
        
        iPrime.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        iI.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        totalPopulation.append(sS[0])
        
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            let newiIValue = iI[n] + iPrime[n] * dX
            if(newiIValue > 0){
                iI.append(newiIValue)
            }
            else{
                
                iI.append(0.0)
            }

            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            iPrime.append(beta * sS[n] * zZ[n] - rho * iI[n] - delta * iI[n])
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n] + CureParameter * zZ[n])
            zPrime.append(rho * iI[n] + zeta * rR[n] - alpha * sS[n] * zZ[n] - CureParameter * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n] + delta * iI[n])
            
            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
            
        }
        

        return (iI)
        
    }
    func EradicationModelT(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double, KillRatio: Double, AttackNumber: Double) -> [Double] {
        
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var deltaZ: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        
        
        deltaZ.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        totalPopulation.append(sS[0])
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            

            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(sS[n] * zZ[n] * beta + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n])
            deltaZ.append( -KillRatio * AttackNumber * zZ[n])

            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
        }
        

        
        
        return (totalPopulation)
        
    }
    func EradicationModelS(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double, KillRatio: Double, AttackNumber: Double) -> [Double] {
        
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var deltaZ: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        
        
        deltaZ.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        totalPopulation.append(sS[0])
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
                
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            

            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(sS[n] * zZ[n] * beta + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n])
            deltaZ.append( -KillRatio * AttackNumber * zZ[n])
            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
        }
        

        
        
        return (sS)
        
    }
    func EradicationModelZ(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double, KillRatio: Double, AttackNumber: Double) -> [Double] {
        
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var deltaZ: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        
        
        deltaZ.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        totalPopulation.append(sS[0])
        
        for killDays in stride(from: 0, through: days, by: dX) {
            if ( Int(killDays) % 3 == 0 ) {
                deltaZ.append( -KillRatio * zZ[n])
                zPrime.append(zPrime[n])
                let newzZValue = zZ[n] + deltaZ[deltaZ.count-1] * dX
                if(newzZValue > 0){
                    zZ.append(newzZValue)
                }
                
                sS.append(sS[n])
                rR.append(rR[n])
                sPrime.append(sPrime[n])
                rPrime.append(rPrime[n])
                print(killDays)
            }
            else {
                let newsSValue = sS[n] + sPrime[n] * dX
                if(newsSValue > 0){
                    sS.append(newsSValue)
                }
                else{
                    
                    
                    sS.append(0.0)
                }
                let newzZValue = zZ[n] + zPrime[n] * dX
                if(newzZValue > 0){
                    zZ.append(newzZValue)
                }
                else{
                    
                    zZ.append(0.0)
                }
                let newrRValue = rR[n] + rPrime[n] * dX
                if(newrRValue > 0){
                    rR.append(newrRValue)
                }
                else{
                    
                    rR.append(0.0)
                }
                

                //totalPopPrime.append(GrowthRate)
               // totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
                sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
                zPrime.append(sS[n] * zZ[n] * beta + zeta * rR[n] - alpha * sS[n] * zZ[n])
                rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n])
               // deltaZ.append( -KillRatio * AttackNumber * zZ[n])
            
                
                
                
//                if(newzZValue > totalPopulation[n]){
//                    break
//                }
                
            }
            
                n += 1
            

        }
        

        
        
        return (zZ)
        
    }
    func EradicationModelR(Population: Double, InitialZombieNumber: Double, GrowthRate: Double, alpha: Double, beta: Double, zeta: Double, delta: Double, days: Double, KillRatio: Double, AttackNumber: Double) -> [Double] {
        
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var deltaZ: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        
        var totalPopPrime: [Double] = []
        var totalPopulation: [Double] = []
        
        
        deltaZ.append(0.0)
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        sS.append(Population)
        zZ.append(InitialZombieNumber)
        rR.append(0.0)
        var n = 0
        totalPopulation.append(sS[0])
        
        for _ in stride(from: 0, through: days, by: dX) {
            
            let newsSValue = sS[n] + sPrime[n] * dX
            if(newsSValue > 0){
                sS.append(newsSValue)
            }
            else{
            
                
                sS.append(0.0)
            }
            let newzZValue = zZ[n] + zPrime[n] * dX
            if(newzZValue > 0){
                zZ.append(newzZValue)
            }
            else{
                
                zZ.append(0.0)
            }
            let newrRValue = rR[n] + rPrime[n] * dX
            if(newrRValue > 0){
                rR.append(newrRValue)
            }
            else{
                
                rR.append(0.0)
            }
            
            totalPopPrime.append(GrowthRate)
            totalPopulation.append(totalPopulation[n] + totalPopPrime[n] * dX)
            sPrime.append(GrowthRate - sS[n] * zZ[n] * beta - delta * sS[n])
            zPrime.append(sS[n] * zZ[n] * beta + zeta * rR[n] - alpha * sS[n] * zZ[n])
            rPrime.append(delta * sS[n] + alpha * sS[n] * zZ[n] - zeta * rR[n])
            deltaZ.append( -KillRatio * AttackNumber * zZ[n])
            
            n += 1
            
            if(newzZValue > totalPopulation[n-1]){
                break
            }
        }
        

        
        return (rR)
        
    }

    
}

    
