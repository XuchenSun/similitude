package com.mun.model.attribute;
import com.mun.model.enumeration.AttrType;
class NameAttr implements Attribute{
    var name:String="name";
    var AttrType:AttrType=AttrType.STRING;
    var defaultname:NameValue=new NameValue("");

    public function new() {
    }

    public function getName():String{
        return name;
    }

    public function getdefaultvalue():AttrValue{
        return defaultname;
    }

    public function getAttrType():AttrType{
        return AttrType;
    }


}