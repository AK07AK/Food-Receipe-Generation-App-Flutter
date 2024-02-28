part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class ChatGenerateNewTextMessageEvents extends ChatEvent {
  final String inputMessage;

  ChatGenerateNewTextMessageEvents(this.inputMessage);
}
