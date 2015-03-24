//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Tricia Short on 3/20/15.
//  Copyright (c) 2015 Tricia Short. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var receivedAudio:RecordedAudio!
    
    
    var audioPlayer:AVAudioPlayer!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathURL, error: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

      @IBAction func playSlowSound(sender: UIButton) {
        //Play audio sloooowly here...
        
        stopAudioSub()
        
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playFastSound(sender: UIButton) {
        //Play audio fast!
        
        stopAudioSub()
        
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func PlayChipmunkAudio(sender: UIButton) {
        //play the Chipmunk audio
        playAudioWithVariablePitch(1000)
    }
    
    
    @IBAction func PlayDarthvaderAudio(sender: UIButton) {
        //play Darth Vader audio
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){

        stopAudioSub()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    
    @IBAction func stopAudio(sender: UIButton) {
        //Stop the audio!
        
        stopAudioSub()
    }
    
    func stopAudioSub(){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }

}
