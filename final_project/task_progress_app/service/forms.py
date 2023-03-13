from flask_wtf import FlaskForm
from wtforms import SelectField, SubmitField, TextAreaField, ValidationError, HiddenField, FloatField
from wtforms.validators import DataRequired



class CurrencyForm(FlaskForm):
    amount = FloatField('Сумма оплаты:', validators=[DataRequired('Сумма должна состоять из цыфр!')])
    currency = SelectField(choices=[(0, 'Выберите валюту оплаты:'), (840,'USD'), (978,'EUR'), (643,'RUB')],
                           validators=[DataRequired()],  default=0)
    description = TextAreaField(default="Введите описание товара", validators=[DataRequired()])
    submit = SubmitField('Отправить')

    def validate_currency(self, currency):
        if int(self.currency.data) == 0:
            raise ValidationError('Выберите валюту!')

    def validate_amount(self, amount):
        if self.amount.data <= 1:
            raise ValidationError('Сумма должна быть больше единицы!')


class PayForm(FlaskForm):
    amount = HiddenField()
    currency = HiddenField()
    description = HiddenField()
    shop_id = HiddenField()
    sign = HiddenField()
    shop_order_id = HiddenField()

