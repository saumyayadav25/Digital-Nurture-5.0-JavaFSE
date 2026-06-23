public class EcommerceSearch{
    public static Product linearSearch(Product[] products, int targetId){
        for(Product product: products){
            if(product.productId == targetId){
                return product;
            }
        }
        return null;
    }
    public static Product binarySearch(Product[] products, int targetId){
        int s = 0;
        int e = products.length-1;
        while(s <= e){
            int mid = s + (e - s)/2;
            if(products[mid].productId == targetId){
                return products[mid];
            }
            if(products[mid].productId > targetId){
                e = mid-1;
            }
            else{
                s = mid + 1;
            }
        }
        return null;
    }
    public static void main(String[] args){
        Product[] products = {
            new Product(1, "Laptop", "Electronics"),
            new Product(2, "Phone", "Electronics"),
            new Product(3, "Shoes", "Fashion"),
            new Product(4, "Watch", "Accessories"),
            new Product(5, "Book", "Education")
        };
        int targetId = 4;
        Product linear_result = linearSearch(products, targetId);
        System.out.println("LINEAR SEARCH RESULT: ");
        if(linear_result != null){
            System.out.println("Product ID: " + linear_result.productId);
            System.out.println("Product Name: " + linear_result.productName);
            System.out.println("Category: " + linear_result.category);
        }
        else System.out.println("Product not found!");

        Product binarySearch_result = binarySearch(products, targetId);
        System.out.println("BINARY SEARCH RESULT: ");
        if(binarySearch_result != null){
            System.out.println("Product ID: " + binarySearch_result.productId);
            System.out.println("Product Name: " + binarySearch_result.productName);
            System.out.println("Category: " + binarySearch_result.category);
        }
        else System.out.println("Product not found!");
    }
}