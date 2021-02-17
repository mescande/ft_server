<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'user42' );

/** MySQL database password */
define( 'DB_PASSWORD', 'user42' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ';LKZAMZH1+v;e=/Mjw=ZXn!{q&2ovmTr+wpygwsZ>w]uS1z~V7T~}FKWu3XoJ8%F' );
define( 'SECURE_AUTH_KEY',  'J}sv{CDBxwYg>-&t8jGvX{`E|-#U|)m$DQEpN4Na5Q}[ML<q@u/;B?PH&_;~IG4M' );
define( 'LOGGED_IN_KEY',    'DWk#|:1VNr1bU?hx1;id-~!R|G$nc1r!%dZMgOa~%zZ(#2Or|pYA@c=HUY^%9HX@' );
define( 'NONCE_KEY',        'MJ{--HGAKo7jUP>Bw9!>X%esv4smF>`2Tl8^nS#nUpMo)/.,2BbQ7=bV(3*T,9E6' );
define( 'AUTH_SALT',        'Zo&ryD+;x=&<>T$eN*QBff)qiujfIq!M_>)P(Ia.!tlskb>yq6l6U#N; J3S*V:T' );
define( 'SECURE_AUTH_SALT', '%v7+OSUbjC=;s9})v6)[TO^e^fAOY+j.xW|(:Nl0<yn: ;u441_6DXH2rV1XPr?]' );
define( 'LOGGED_IN_SALT',   'aIoMVJT5BBE|Vsxr=jQlsIQNsSO-b}5uf?8i(([-!>nVQ#RB#~-7E*Yp*Yp._ $;' );
define( 'NONCE_SALT',       ':<_i.6ylL)7+9=%fnP#4wL|kI(H:zgSTBBY;9m-$GwyFs#K:h{4}5?sat$*_Fdf~' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
