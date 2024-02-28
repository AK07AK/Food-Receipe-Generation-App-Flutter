import 'dart:async';

import 'package:ai_assistant/models/chat_message_mode.dart';
import 'package:ai_assistant/repos/chat_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messsages: [])) {
    on<ChatGenerateNewTextMessageEvents>(chatGenerateNewTextMessageEvents);
  }
  List<ChatMessageModel> messages = [];

  FutureOr<void> chatGenerateNewTextMessageEvents(
      ChatGenerateNewTextMessageEvents event, Emitter<ChatState> emit) async {
    messages.add(ChatMessageModel(
        role: "user", parts: [ChatPartModel(text: event.inputMessage)]));
    emit(ChatSuccessState(messsages: messages));
    await ReceipeRepo.chatTextGenerationRepo(messages);
  }
}
