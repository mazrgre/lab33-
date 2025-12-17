import { Injectable, NotFoundException } from '@nestjs/common';

export interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  category: string;
}

@Injectable()
export class ProductsService {
  private products: Product[] = [
    {
      id: 1,
      name: 'Веб-розробка',
      description: 'Створення сучасних веб-додатків',
      price: 5000,
      category: 'Послуги',
    },
    {
      id: 2,
      name: 'Мобільний додаток',
      description: 'Розробка мобільних додатків для iOS та Android',
      price: 8000,
      category: 'Послуги',
    },
    {
      id: 3,
      name: 'Консультація',
      description: 'Технічна консультація з розробки',
      price: 1000,
      category: 'Послуги',
    },
    {
      id: 4,
      name: 'Ноутбук',
      description: 'Потужний ноутбук для розробки',
      price: 25000,
      category: 'Товари',
    },
    {
      id: 5,
      name: 'Монітор',
      description: '4K монітор для роботи',
      price: 8000,
      category: 'Товари',
    },
  ];

  findAll(): Product[] {
    return this.products;
  }

  findOne(id: number): Product {
    const product = this.products.find((p) => p.id === id);
    if (!product) {
      throw new NotFoundException(`Товар/послуга з ID ${id} не знайдено`);
    }
    return product;
  }
}
