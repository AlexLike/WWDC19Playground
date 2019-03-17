//
//  Languages.swift
//  Book_Sources
//
//  Created by Alexander Zank on 17.03.19.
//

import Foundation

public enum Language: String {
  case englishUS = "englishUS"
  case englishGB = "englishGB"
  case englishAU = "englishAU"
  case german = "german"
  case french = "french"
  case italian = "italian"
  case spanish = "spanish"
  case portuguese = "portuguese"
  case romanian = "romanian"
  case russian = "russian"
  case mandarinChinese = "mandarinChinese"
  case japanese = "japanese"
  case hindi = "hindi"
  case arabic = "arabic"
  case malay = "malay"
  case bengali = "bengali"
  case vietnamese = "vietnamese"
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
