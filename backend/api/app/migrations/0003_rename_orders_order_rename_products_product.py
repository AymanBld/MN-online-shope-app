# Generated by Django 5.1.6 on 2025-02-19 21:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_products_favorited_by'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Orders',
            new_name='Order',
        ),
        migrations.RenameModel(
            old_name='Products',
            new_name='Product',
        ),
    ]
