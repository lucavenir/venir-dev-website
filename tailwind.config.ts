import type { Config } from 'tailwindcss'
import { iconsPlugin, getIconCollections } from "@egoist/tailwindcss-icons"
import defaultTheme from 'tailwindcss/defaultTheme'

export default <Partial<Config>>{
   darkMode: 'class',
   plugins: [
      iconsPlugin({
         collections: getIconCollections("all"),
      })
   ],
   theme: {
      extend: {
         fontFamily: {
            sans: ['Lexend Deca', ...defaultTheme.fontFamily.sans],
         },
         colors: {
            tradewind: {
               '50': '#f3faf9',
               '100': '#d6f1ee',
               '200': '#ade2dd',
               '300': '#7cccc6',
               '400': '#4daaa7',
               '500': '#379594',
               '600': '#2a7777',
               '700': '#255f60',
               '800': '#224b4d',
               '900': '#204041',
               '950': '#0d2526',
            },
            mineShaft: {
               '50': '#f6f6f6',
               '100': '#e7e7e7',
               '200': '#d1d1d1',
               '300': '#b0b0b0',
               '400': '#888888',
               '500': '#6d6d6d',
               '600': '#5d5d5d',
               '700': '#4f4f4f',
               '800': '#454545',
               '900': '#333333',
               '950': '#262626',
            },
            yellowOrange: {
               '50': '#fff8eb',
               '100': '#feeac7',
               '200': '#fdd48a',
               '300': '#fbb03b',
               '400': '#fa9e25',
               '500': '#f47a0c',
               '600': '#d85607',
               '700': '#b3390a',
               '800': '#922b0e',
               '900': '#78250f',
               '950': '#451003',
            },
         }
      }
   }
}
