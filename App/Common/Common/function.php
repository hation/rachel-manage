<?php
header("Content-type:text/html;charset=utf-8");
function readExcel($filePath)
{
    header("Content-type:text/html;charset=utf-8");
    vendor('PHPExcel.PHPExcel');
    $PHPReader = new \PHPExcel_Reader_Excel2007();
    if (!$PHPReader->canRead($filePath)) {
        $PHPReader = new \PHPExcel_Reader_Excel5();
        if (!$PHPReader->canRead($filePath)) {
            $this->error('不能读到Excel');
        }
    }

    $PHPExcel = $PHPReader->load($filePath);
    $PHPExcel->discardMacros();
    $data = array();  //��������
    // var_dump($PHPExcel->getAllSheets());
    foreach ($PHPExcel->getAllSheets() as $index => $currentSheet) {

        $sheetName = $currentSheet->getTitle();
        //$allColumn = $currentSheet->getHighestColumn(); //ȡ�������к�
        //$allRow = $currentSheet->getHighestRow(); //ȡ��һ���ж�����

        $data[$sheetName] = $currentSheet->toArray();

        /**Excel 从1开始*/
        /*
        for($currentRow = 1;$currentRow <= $allRow;$currentRow++){
            //�ӵ�A�п�ʼ
            for($currentColumn= 'A';$currentColumn<= $allColumn; $currentColumn++){
                $addr = $currentColumn.$currentRow;
                $cell = $currentSheet->getCell($addr)->getValue();
                if($cell instanceof PHPExcel_RichText)     //���ı�ת���ַ���
                    $cell = $cell->__toString();
                $data[$sheetName][$currentRow-1][] = $cell;
                //如果输出汉字有乱码，则需将输出内容用iconv函数进行编码转换，如下将gb2312编码转为utf-8编码输出
                //echo iconv('utf-8','gb2312', $val)."\t"; */
    }
    return $data;
}

function uploadImage($file, $rootPath = './Public/Upload/')
{
    $upload = new \Think\Upload();// 实例化上传类
    $upload->maxSize = 3145728;// 设置附件上传大小
    $upload->exts = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
    $upload->rootPath = $rootPath; // 设置附件上传根目录
    $info = $upload->uploadOne($file);
    return $info;
}

function genRandCode($length)
{
    $str = null;
    $strPol = "0123456789";
    $max = strlen($strPol) - 1;

    for ($i = 0; $i < $length; $i++) {
        $str .= $strPol[rand(0, $max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
    }
    return $str;
}

function createdOrderNumber()
{
    $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
        'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
    $nowYear = 2017;
    if ((intval(date('Y')) - $nowYear) > 25) {

        $nowYear = intval(date('Y'));
    }
    $OrderNumber = $yCode[intval(date('Y')) - $nowYear]
        . strtoupper(dechex(date('m')))
        . date('d') . substr(time(), -5)
        . substr(microtime(), 2, 5)
        . sprintf('%02d', rand(0, 99));

    return $OrderNumber;
}