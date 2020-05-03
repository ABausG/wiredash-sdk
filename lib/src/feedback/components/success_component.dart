import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiredash/src/common/translation/wiredash_translation.dart';
import 'package:wiredash/src/common/widgets/list_tile_button.dart';
import 'package:wiredash/src/common/widgets/wiredash_icons.dart';
import 'package:wiredash/src/feedback/feedback_model.dart';

class SuccessComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedbackModel = Provider.of<FeedbackModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          if (feedbackModel.loading) Text('Sending image...'),
          if (feedbackModel.error) Text('Something went wrong!'),
          ListTileButton(
            icon: WiredashIcons.exit,
            iconColor: const Color(0xff9c4db1),
            iconBackgroundColor: const Color(0xffffc4f0),
            title:
                WiredashTranslation.of(context).feedbackStateSuccessCloseTitle,
            subtitle:
                WiredashTranslation.of(context).feedbackStateSuccessCloseMsg,
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
