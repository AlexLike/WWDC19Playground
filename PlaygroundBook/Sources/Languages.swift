//
//  Languages.swift
//  Book_Sources
//
//  Created by Alexander Zank on 17.03.19.
//

import Foundation

public enum Language: String {
  case englishUS = "American English"
  case englishGB = "British English"
  case englishAU = "Australian English"
  case german = "German"
  case french = "French"
  case italian = "Italian"
  case spanish = "Spanish"
  case portuguese = "Portuguese"
  case romanian = "Romanian"
  case russian = "Russian"
  case mandarinChinese = "Mandarin Chinese"
  case japanese = "Japanese"
  case hindi = "Hindi"
  case arabic = "Arabic"
  case malay = "Malay"
  case bengali = "Bengali"
  case vietnamese = "Vietnamese"
}

func helloInLanguage(_ language: Language) -> String {
  switch language {
  case .englishUS, .englishGB, .englishAU: return "Hello"
  case .german: return "Hallo"
  case .french: return "Bonjour"
  case .italian: return "Ciao"
  case .spanish: return "¡Hola"
  case .portuguese: return "Olá"
  case .romanian: return "Salut"
  case .russian: return "привет"
  case .mandarinChinese: return "你好"
  case .japanese: return "もしもし"
  case .hindi: return "नमस्ते"
  case .arabic: return "مرحبا"
  case .malay: return "Hello"
  case .bengali: return "হ্যালো"
  case .vietnamese: return "Xin chào"
  }
}

func flagEmojiForLanguage(_ language: Language) -> String {
  switch language {
  case .englishUS: return "🇺🇸"
  case .englishGB: return "🇬🇧"
  case .englishAU: return "🇦🇺"
  case .german: return "🇩🇪"
  case .french: return "🇫🇷"
  case .italian: return "🇮🇹"
  case .spanish: return "🇪🇸"
  case .portuguese: return "🇵🇹"
  case .romanian: return "🇷🇴"
  case .russian: return "🇷🇺"
  case .mandarinChinese: return "🇨🇳"
  case .japanese: return "🇯🇵"
  case .hindi: return "🇮🇳"
  case .arabic: return "🇮🇱"
  case .malay: return "🇲🇾"
  case .bengali: return "🇮🇳"
  case .vietnamese: return "🇻🇳"
  }
}
