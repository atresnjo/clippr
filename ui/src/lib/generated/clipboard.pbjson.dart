///
//  Generated code. Do not modify.
//  source: clipboard.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

const ClipboardUpdateType$json = const {
  '1': 'ClipboardUpdateType',
  '2': const [
    const {'1': 'DELETED', '2': 0},
    const {'1': 'CREATED', '2': 1},
  ],
};

const RegisterConnection$json = const {
  '1': 'RegisterConnection',
  '2': const [
    const {'1': 'deviceName', '3': 1, '4': 1, '5': 9, '10': 'deviceName'},
  ],
};

const CreateRequest$json = const {
  '1': 'CreateRequest',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'createdBy', '3': 2, '4': 1, '5': 9, '10': 'createdBy'},
  ],
};

const DeleteRequest$json = const {
  '1': 'DeleteRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const DeleteReply$json = const {
  '1': 'DeleteReply',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 8, '10': 'response'},
  ],
};

const CreateReply$json = const {
  '1': 'CreateReply',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 8, '10': 'response'},
  ],
};

const FetchRequest$json = const {
  '1': 'FetchRequest',
};

const FetchReply$json = const {
  '1': 'FetchReply',
  '2': const [
    const {'1': 'clipboardEntries', '3': 1, '4': 3, '5': 11, '6': '.Clippr.ClipboardEntry', '10': 'clipboardEntries'},
  ],
};

const ClipboardEntryMessage$json = const {
  '1': 'ClipboardEntryMessage',
  '2': const [
    const {'1': 'clipboardEntry', '3': 1, '4': 1, '5': 11, '6': '.Clippr.ClipboardEntry', '10': 'clipboardEntry'},
    const {'1': 'clipboardUpdateType', '3': 2, '4': 1, '5': 14, '6': '.Clippr.ClipboardUpdateType', '10': 'clipboardUpdateType'},
  ],
};

const ClipboardEntry$json = const {
  '1': 'ClipboardEntry',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'createdAt', '3': 2, '4': 1, '5': 9, '10': 'createdAt'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'createdBy', '3': 4, '4': 1, '5': 9, '10': 'createdBy'},
  ],
};

