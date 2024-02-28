part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ReceipeAssistantInitial extends ChatState {}

final class ChatSuccessState extends ChatState {
  final List<ChatMessageModel> messsages;
  ChatSuccessState({required this.messsages});
}
