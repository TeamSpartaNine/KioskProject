//
//  ZoomButton.swift
//  Kiosk
//
//  Created by t2023-m0024 on 12/29/23.
//

import UIKit
import AVFoundation

class ZoomButton: UIButton, Zoomable {
    var audioPlayer: AVAudioPlayer?
    var isZoomEnabled = false
    private var pinchGesture: UIPinchGestureRecognizer!
    
    func zoomIn() {
        UIView.animate(withDuration: 0.3) {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    func zoomOut() {
        UIView.animate(withDuration: 0.3) {
            self.transform = .identity
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupZoomButton()
        setupPinchGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupZoomButton() {
        setTitle("Zoom", for: .normal)
        setTitle("Unzoom", for: .selected)
        backgroundColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
        
        if let zoomImage = UIImage(named: "Image2") {
            setImage(zoomImage, for: .normal)
        }
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupPinchGesture() {
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        addGestureRecognizer(pinchGesture)
    }
    
    @objc private func handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .changed, .ended:
            let scale = sender.scale
            transform = transform.scaledBy(x: scale, y: scale)
            sender.scale = 1.0
        default:
            break
        }
    }
    
    @objc private func buttonTapped() {
        playGuideAudio()
        toggleZoom()
    }
    
    // MARK: - Audio
    private func playGuideAudio() {
        guard let path = Bundle.main.path(forResource: "audio", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
            // 'self'를 사용하여 해당 인스턴스의 'audioPlayer'에 할당합니다.
            self.audioPlayer = audioPlayer
        } catch {
            print("Error playing audio")
        }
    }
    
    // MARK: - Zoom Logic
    private func toggleZoom() {
        isZoomEnabled.toggle()
        // Toggle zoom logic here
    }
}
