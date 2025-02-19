from django.db import models
from django.contrib.auth.models import AbstractUser

class MyUser(AbstractUser):
    phone = models.IntegerField(null=True, blank=True)

class Category(models.Model):
    name = models.CharField(max_length=100)
    image_url = models.ImageField(upload_to='images/category/')

    def __str__(self):
        return self.name
    
class Product(models.Model):
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=1000, default='No description available')
    price = models.FloatField()
    discount = models.FloatField()
    image_url = models.ImageField(upload_to='images/products/')
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    favorited_by = models.ManyToManyField(MyUser, related_name='favorite_products')

    def __str__(self):
        return self.name

class Delevry(models.Model):
    # !!!!!!!i will modify this model like a user model

    name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=100)

    def __str__(self):
        return self.user.username

class Address(models.Model):
    name = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    street = models.CharField(max_length=100)
    lang = models.FloatField()
    lat = models.FloatField()
    user = models.ForeignKey(MyUser, on_delete=models.CASCADE)

    def __str__(self):
        return self.name, 'of', self.user
    
class Order(models.Model):
    user = models.ForeignKey(MyUser, on_delete=models.CASCADE)
    delivery = models.ForeignKey(Delevry, on_delete=models.CASCADE)
    total_price = models.FloatField()
    quantity = models.IntegerField()
    address = models.ForeignKey(Address, on_delete=models.CASCADE)
    status = models.CharField(max_length= 50, choices= [('Pending', 'pending'), ('Delevred', 'delevred'), ('InStock', 'in stock')])
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user
    


class Cart(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    total_price = models.FloatField()
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.product.name

class Coupon(models.Model):
    name = models.CharField(max_length=100)
    discount = models.FloatField()
    quantity = models.IntegerField()
    
    dateEx = models.DateField()

    def __str__(self):
        return self.name


