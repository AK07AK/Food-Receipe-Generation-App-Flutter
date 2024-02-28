import 'package:ai_assistant/bloc/chat_bloc.dart';
import 'package:ai_assistant/models/chat_message_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatBloc bloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messsages;
              return Container(
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(bottom: 19),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Text(messages[index].parts.first.text));
                      },
                    )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 16),
                      child: Row(children: [
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            cursorColor: Theme.of(context).primaryColor,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            if (textEditingController.text.isNotEmpty) {
                              bloc.add(ChatGenerateNewTextMessageEvents(
                                  textEditingController.text));
                            }
                          },
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.send,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
