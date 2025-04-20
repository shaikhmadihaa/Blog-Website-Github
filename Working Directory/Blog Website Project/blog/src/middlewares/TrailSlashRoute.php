<?php

namespace App\Middleware;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class TrailSlashRoute
{

    /**
     * Scapes trailing salshed from get request
     *
     * @param Psr\Http\Message\ServerRequestInterface $request PSR7 request
     * @param Psr\Http\Message\ResponseInterface $response PSR7 response 
     * @param callable $next Next middleware
     * @return Psr\Http\Message\ResponseInterface
     */
    public function __invoke(Request $request, Response $response, $next)
    {
        $uri = $request->getUri();
        $path = $uri->getPath();
        if ($path != '/' && substr($path, -1) == '/') {
            $uri = $uri->withPath(substr($path, 0, -1));

            if ($request->getMethod() == 'GET') {
                return $next($request->withUri($uri), $response);
            } else {
                return $response->withRedirect((string) $uri, 301);
            }
        }

        return $next($request, $response);
    }
}
