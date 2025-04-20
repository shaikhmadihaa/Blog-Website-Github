<?php
use PHPUnit\Framework\TestCase;

final class FormaterTest extends TestCase
{
    public function testSpaceToDash(): void
    {
        $this->assertEquals(
            'mofiqul-islam-is-a-good-man',
            \App\Helper\Formater::space2dash('Mofiqul Islam is a good man')
        );

        $this->assertEquals(
            'create-react-app-from-scratch',
            \App\Helper\Formater::space2dash('Create react app from scratch')
        );
    }

    public function testDateFormat(): void
    {
        $this->assertEquals(
            '22-08-2019',
            \App\Helper\Formater::dateFormat('2019-08-22 22:45:18', 'd-m-Y')
        );

        $this->assertEquals(
            '22-Aug-2019',
            \App\Helper\Formater::dateFormat('2019-08-22 22:45:18', 'd-M-Y')
        );

        $this->assertEquals(
            'Aug-22-2019',
            \App\Helper\Formater::dateFormat('2019-08-22 22:45:18', 'M-d-Y')
        );

        $this->assertEquals(
            'Aug-22-19',
            \App\Helper\Formater::dateFormat('2019-08-22 22:45:18', 'M-d-y')
        );

        $this->assertEquals(
            '08-22-19',
            \App\Helper\Formater::dateFormat('2019-08-22 22:45:18', 'm-d-y')
        );

        $this->assertEquals(
            '22-08-19',
            \App\Helper\Formater::dateFormat('2019-08-22 22:45:18', 'd-m-y')
        );
    }
}