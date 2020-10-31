Sub split_sheets()
'-----------------------------------------------------------------------------------------------------
'
'ブックに含まれる全てのシートを、それぞれ別ブックとして保存する。
'
'-----------------------------------------------------------------------------------------------------
    Dim ws As Worksheet '対象シート
    Dim file_name As String 'ファイル名
    Dim dir_path As String 'カレントディレクトリ
    Dim sp As String 'フォルダの区切り文字

    'OSごとの区切り文字を取得
    sp = Application.PathSeparator
    '拡張子を取り除いたファイル名を作成
    file_name = ThisWorkbook.Name
    file_name = Left(file_name, Len(file_name) - 5)
    '保存先ディレクトリパスを作成
    dir_path = ThisWorkbook.Path & sp & file_name

    '保存先ディレクトリが存在しない場合は作成する
    If Dir(dir_path, vbDirectory) = "" Then
        MkDir dir_path
    End If

    '保存先ディレクトリへ移動
    ChDir dir_path

    '全てのシートを個別に保存
    Application.ScreenUpdating = False
    For Each ws In Worksheets
        ws.Copy
        With ActiveWorkbook
            .SaveAs ActiveSheet.Name & sp & ws.Name
            .Close
        End With
    Next ws
    Application.ScreenUpdating = True

'完了メッセージの表示
hundler:
    MsgBox "Completed!"
End Sub
