CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    //  config.extraPlugins = 'cloudservices';
    var base_url = $('head').data('baseurl');
    config.removePlugins = 'easyimage, cloudservices';

    //config.filebrowserBrowseUrl = base_url + '/ckfinder/ckfinder.html';
    config.filebrowserBrowseUrl = base_url + '/admin/ckfinder-custom';

    config.filebrowserImageBrowseUrl = base_url + '/admin/ckfinder-custom?type=Images';

    config.filebrowserFlashBrowseUrl = base_url + '/admin/ckfinder-custom?type=Flash';

    config.filebrowserUploadUrl = base_url + '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';

    config.filebrowserImageUploadUrl = base_url + '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';

    config.filebrowserFlashUploadUrl = base_url + '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';

    config.toolbarGroups = [
        { name: 'document', groups: ['mode', 'document', 'doctools'] },
        { name: 'clipboard', groups: ['clipboard', 'undo'] },
        { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
        { name: 'forms', groups: ['forms'] },
        { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
        { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
        { name: 'links', groups: ['links'] },
        { name: 'insert', groups: ['insert'] },
        { name: 'styles', groups: ['styles'] },
        { name: 'colors', groups: ['colors'] },
        { name: 'tools', groups: ['tools'] },
        { name: 'others', groups: ['others'] },
        { name: 'about', groups: ['about'] }
    ];

    config.removeButtons = 'Save,NewPage,Preview,Print,Templates,Cut,Copy,Paste,PasteText,PasteFromWord,Undo,Redo,Find,Replace,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Subscript,Superscript,CopyFormatting,RemoveFormat,Outdent,Indent,Blockquote,CreateDiv,BidiLtr,BidiRtl,Language,Anchor,Flash,SpecialChar,PageBreak,About,ShowBlocks,Maximize,Strike,Underline,Font,Iframe,Smiley,Styles';
};

