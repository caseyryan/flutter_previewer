import 'package:flutter/material.dart';

@immutable
class TelegramColors extends ThemeExtension<TelegramColors> {
  final Color? messageBubbleColor;
  final Color? messageTextColor;
  final Color? quoteColor;
  final Color? quoteSideLineColor;
  final Color? quotedTextColor;
  final Color? codeBlockBackgroundColor;
  final Color? codeBlockSideLineColor;
  final Color? codeBlockTextColor;
  final Color? codeBlockHeaderColor;
  final LinearGradient? buttonGradient;

  const TelegramColors({
    this.messageBubbleColor,
    this.messageTextColor,
    this.quoteColor,
    this.quoteSideLineColor,
    this.quotedTextColor,
    this.codeBlockBackgroundColor,
    this.codeBlockSideLineColor,
    this.codeBlockTextColor,
    this.codeBlockHeaderColor,
    this.buttonGradient,
  });

  factory TelegramColors.dark() {
    return const TelegramColors(
      messageBubbleColor: Color(0xFF4C9EFD),
      messageTextColor: Colors.white,
      quoteColor: Color(0xff233e3c),
      quoteSideLineColor: Color(0xff40a920),
      quotedTextColor: Color(0xFF6C757D),
      codeBlockBackgroundColor: Color(0xFF182431),
      codeBlockSideLineColor: Color(0xFFdfdfdf),
      codeBlockTextColor: Color(0xFFf4f4f4),
      codeBlockHeaderColor: Color(0xFF535b63),
      buttonGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 131, 33, 164),
          Color.fromARGB(255, 93, 27, 155),
        ],
      ),
    );
  }

  factory TelegramColors.light() {
    return const TelegramColors(
      messageBubbleColor: Color(0xFF4C9EFD),
      messageTextColor: Colors.black,
      quoteColor: Color(0xfffaedf3),
      quoteSideLineColor: Color(0xffc7518c),
      quotedTextColor: Color(0xFF6C757D),
      
      codeBlockBackgroundColor: Color(0xFFc7d9ea),
      codeBlockSideLineColor: Color(0xFF2380cb),
      codeBlockTextColor: Color(0xFF1D9BF0),
      codeBlockHeaderColor: Color(0xFFacc8e4),

      buttonGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 208, 32, 194),
          Color.fromARGB(255, 175, 30, 163),
        ],
      ),
    );
  }

  @override
  ThemeExtension<TelegramColors> copyWith({
    Color? messageBubbleColor,
    Color? messageTextColor,
    Color? quoteColor,
    Color? quoteSideLineColor,
    Color? quotedTextColor,
    Color? codeBlockBackgroundColor,
    Color? codeBlockSideLineColor,
    Color? codeBlockTextColor,
    Color? codeBlockHeaderColor,
    LinearGradient? buttonGradient,
  }) {
    return TelegramColors(
      messageBubbleColor: messageBubbleColor ?? this.messageBubbleColor,
      messageTextColor: messageTextColor ?? this.messageTextColor,
      quoteColor: quoteColor ?? this.quoteColor,
      quoteSideLineColor: quoteSideLineColor ?? this.quoteSideLineColor,
      quotedTextColor: quotedTextColor ?? this.quotedTextColor,
      codeBlockBackgroundColor: codeBlockBackgroundColor ?? this.codeBlockBackgroundColor,
      codeBlockSideLineColor: codeBlockSideLineColor ?? this.codeBlockSideLineColor,
      codeBlockTextColor: codeBlockTextColor ?? this.codeBlockTextColor,
      buttonGradient: buttonGradient ?? this.buttonGradient,
    );
  }

  @override
  ThemeExtension<TelegramColors> lerp(
    covariant ThemeExtension<TelegramColors>? other,
    double t,
  ) {
    if (other is! TelegramColors) {
      return this;
    }

    return TelegramColors(
      messageBubbleColor: Color.lerp(messageBubbleColor, other.messageBubbleColor, t),
      messageTextColor: Color.lerp(messageTextColor, other.messageTextColor, t),
      quoteColor: Color.lerp(quoteColor, other.quoteColor, t),
      quoteSideLineColor: Color.lerp(quoteSideLineColor, other.quoteSideLineColor, t),
      quotedTextColor: Color.lerp(quotedTextColor, other.quotedTextColor, t),
      codeBlockBackgroundColor: Color.lerp(codeBlockBackgroundColor, other.codeBlockBackgroundColor, t),
      codeBlockSideLineColor: Color.lerp(codeBlockSideLineColor, other.codeBlockSideLineColor, t),
      codeBlockTextColor: Color.lerp(codeBlockTextColor, other.codeBlockTextColor, t),
      codeBlockHeaderColor: Color.lerp(codeBlockHeaderColor, other.codeBlockHeaderColor, t),
      buttonGradient: t < 0.5
          ? buttonGradient
          : other.buttonGradient,
    );
  }

  static TelegramColors of(BuildContext context) {
    return Theme.of(context).extension<TelegramColors>()!;
  }
}
