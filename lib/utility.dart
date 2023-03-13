import 'package:ecommerce/models/ProductsResponse.dart';
import 'package:flutter/material.dart';

class Utility {
  static customCard(ProductsResponse productsResponse) {
    Color textColor=Colors.redAccent;
    return InkWell(
      onTap: () {
        /// Implement view page
        ///
      },
      child: Card(
        child: Container(
          height: 210,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(productsResponse.image),
              ),
              Text(productsResponse.name,style: const TextStyle(color: Colors.black,fontSize: 18),),
              const SizedBox(height: 1.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(productsResponse.price.toString(),style: const TextStyle(color: Colors.black,fontSize: 14),),
                    CircleAvatar(radius: 10,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.shopping_cart_outlined,color: textColor,size: 15,),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}



class TextInputField{
  static customTextForm(labelType,labelText,obscureValue,icon,hint,validatorForm, controller, {int maxLine = 1}){
    return Container(height:65,width:320,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        border: Border.all(color: Colors.grey.withOpacity(.2),
            width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextFormField(
          controller: controller,
          validator: validatorForm,
          keyboardType: labelType,
          obscureText: obscureValue,
          maxLines: maxLine,
          decoration: InputDecoration(
            fillColor: Colors.grey,
            focusColor: Colors.grey,
            border: InputBorder.none,
            label: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(labelText),
            ),
            labelStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
            suffix:obscureValue?icon:null,
            hintText: hint,


          ),
        ),
      ),
    );
  }
}
