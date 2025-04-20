<?php

use PHPUnit\Framework\TestCase;

final class AuthorRequestTest extends TestCase
{
    public function testAllRequrst(): void
    {
        $this->assertIsIterable(
            \App\Model\AuthorRequest::all()
        );
    }
}
