//
//  ContentView.swift
//  TimerApp
//
//  Created by Akshay Nandane on 30/06/23.
//

import SwiftUI

struct buttonModifier: ViewModifier {
    func body(content: Content) -> some View { content
        .frame(maxWidth: 150)
        .padding()
        .font(.largeTitle)
        .border(.yellow, width: 4)
        .foregroundColor(.white)
    }
}

struct ContentView: View {
    @State private var timer: Timer?
    @State private var isStarted: Bool = false
    @State private var isTimerRunning: Bool = false
    @State private var timerCount: Int = 0
    
    var body: some View {
        VStack {
            Text("Stopwatch App")
                .font(.title)
            Divider()
            Spacer()
            Button(action: {
                print("Timer Start")
                // Start the Timer
                startTimer()
                
            }, label: {
                Text("Start")
                    .modifier(buttonModifier())
                    .background(Color.green)
                    .opacity(isTimerRunning ? 0.5 : 1)
            })
            .disabled(isTimerRunning)
            
            Text(formattedTime).font(.largeTitle)
            
            Button(action: {
                print("Timer Stop")
                // Stop the Timer
                stopTimer()
            }, label: {
                Text("Stop")
                    .modifier(buttonModifier())
                    .background(Color.red)
            })
            Spacer()
            Button(action: {
                resetTimer()
            }, label: {
                Image(systemName: "gobackward")
                    .font(.largeTitle)
            })
            Spacer()
        }
        .padding()
    }
    
    var formattedTime: String {
        let seconds = timerCount % 60
        let minutes = (timerCount / 60) % 60
        let hours = timerCount / 3600
            
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func formatTimer(sec: TimeInterval) -> String{
        print("\(String(formatTimer(sec: sec)))")
        return String(formatTimer(sec: sec))
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { value in
//            print("Timer started \(value)")
            timerCount += 1
            print(timerCount)
        }
        isTimerRunning = true
    }
    
    func stopTimer(){
        timer?.invalidate()
        isTimerRunning = false
        timer = nil
//        timerCount = 0
    }
    
    func resetTimer(){
        timer?.invalidate()
        isTimerRunning = false
        timer = nil
        timerCount = 0
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
