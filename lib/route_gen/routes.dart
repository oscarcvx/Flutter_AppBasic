/*import 'package:caja18app/routes/licencias/EstadoPlanPago.dart';
import 'package:caja18app/routes/mis_datos/DatosPersonales.dart';
import 'package:caja18app/routes/HomePage.dart';
import 'package:caja18app/routes/UndefinedView.dart';
import 'package:caja18app/routes/contacto/Contacto.dart';
import 'package:caja18app/routes/credito/CreditoDetalle.dart';
import 'package:caja18app/routes/credito/Creditos.dart';
import 'package:caja18app/routes/credito/CreditosMenu.dart';
import 'package:caja18app/routes/devoluciones/Devoluciones.dart';
import 'package:caja18app/routes/leasing/Leasing.dart';
import 'package:caja18app/routes/leasing/LeasingDetalle.dart';
import 'package:caja18app/routes/licencias/LicenciaDetalle.dart';
import 'package:caja18app/routes/licencias/Licencias.dart';
import 'package:caja18app/routes/login/pages/Login.dart';
import 'package:caja18app/routes/login/pages/LoginRegistered.dart';
import 'package:caja18app/routes/mis_datos/MisDatos.dart';
import 'package:caja18app/routes/puntos18/Puntos18Detalle.dart';
import 'package:caja18app/routes/simulador/Simulador.dart';
import 'package:caja18app/routes/simulador/SimuladorDetalle.dart';
import 'package:caja18app/routes/sucursales/SucursalesMap.dart';
import 'package:caja18app/routes/mensajes/BandejaMensajes.dart';
import 'package:caja18app/util/routeBuilder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'NoPermitido.dart';
import 'beneficios/Beneficios.dart';
import 'licencias/CargarDocLicencias.dart';
import 'licencias/EstadoPago.dart';
import 'licencias/PagosListado.dart';
import 'mensajes/DetalleMensaje.dart';
import 'mis_datos/MiCuentaBancaria.dart';

class AppRoutes {
  static const String HomeViewRoute = 'Home';
  static const String InicioViewRoute = '/';
  static const String LoginViewRoute = 'Login';
  static const String LicenciasViewRoute = 'Licencias';
  static const String TarjetaVirtualViewRoute = 'TarjetaVirtual';
  static const String CreditosViewRoute = 'Creditos';
  static const String FirmaCreditoViewRoute = 'FirmaCredito';
  static const String CreditosMenuViewRoute = 'CreditosMenu';
  static const String SucursalesViewRoute = 'Sucursales';
  static const String ContactoViewRoute = 'Contacto';
  static const String MisDatosViewRoute = 'MisDatos';
  static const String DatosPersonalesViewRoute = 'DatosPersonales';
  static const String MiCuentaBancariaViewRoute = 'MiCuentaBancaria';
  static const String PreferenciasViewRoute = 'Preferencias';
  static const String CreditoDetailViewRoute = 'CreditoDetail';
  static const String LicenciaDetailViewRoute = 'LicenciaDetail';
  static const String DetalleMensajeViewRoute = 'DetalleMensaje';
  static const String SimuladorCreditoViewRoute = 'SimuladorCredito';
  static const String SimuladorCreditoDetalleViewRoute = 'SimuladorCreditoDetalle';
  static const String WebViewLoadUrlRouteX = 'WebViewLoadUrl';
  static const String WebViewLoadUrlRouteNBX = 'WebViewLoadUrlNB';
  //static const String TestViewRoute = 'Test';
  static const String BandejaMensajesViewRoute = 'BandejaMensajes';
  static const String Puntos18ViewRoute = 'Puntos18';
  static const String DevolucionesViewRoute = 'Devoluciones';
  static const String LeasingViewRoute = 'Leasing';
  static const String LeasingDetailViewRoute = 'LeasingDetail';
  static const String LoginPassViewRoute = 'LoginPass';
  static const String LoginRegisteredViewRoute = 'LoginRegistered';

  static const String LicenciaListadoPagosViewRoute = 'LicenciaListadoPagos';
  static const String LicenciaDetailPagosViewRoute = 'LicenciaDetallePagos';
  static const String LicenciaDetailPlanPagoViewRoute = 'LicenciaDetallePlanPago';

  static const String NoPermitidoViewRoute = 'NoPermitido';
  static const String CargarDocLicenciasViewRoute = 'CargarDocLicencias';

  static const String BeneficiosViewRoute = 'Beneficios';



  //static const String LicenciaEstadoPagoViewRoute = 'LicenciaEstadoPago';
 // static const String LicenciaEstadoPlanPagoViewRoute = 'LicenciaEstadoPlanPago';

    Map<String, Widget Function(BuildContext)> build(BuildContext context) {
      return {
        HomeViewRoute: (context) => HomePage(),
        LoginViewRoute: (context) => Login(),
        LicenciasViewRoute: (context) => Licencias(),
        CreditosViewRoute: (context) => Creditos(),
        CreditosMenuViewRoute: (context) => CreditosMenu(),
        SucursalesViewRoute: (context) => SucursalesMap(),
        ContactoViewRoute: (context) => Contacto(),
        MisDatosViewRoute: (context) => MisDatos(),
        DatosPersonalesViewRoute: (context) => DatosPersonales(),
        MiCuentaBancariaViewRoute: (context) => MiCuentaBancaria(),
        CreditoDetailViewRoute: (context) => CreditoDetalle(),
        LicenciaDetailViewRoute: (context) => LicenciaDetalle(),
        DetalleMensajeViewRoute: (context) => DetalleMensaje(),|
        SimuladorCreditoViewRoute: (context) => Simulador(),
        SimuladorCreditoDetalleViewRoute: (context) => SimuladorDetalle(),
        BandejaMensajesViewRoute: (context) => BandejaMensajes(),
        Puntos18ViewRoute: (context) => BandejaMensajes(),
        DevolucionesViewRoute: (context) => Devoluciones(),
        LoginRegisteredViewRoute : (context) => LoginRegistered(),
        LeasingDetailViewRoute : (context) => LeasingDetalle(),
        LeasingViewRoute : (context) => Leasing(),
        LicenciaListadoPagosViewRoute : (context) => PagosListado(),

        LicenciaDetailPagosViewRoute : (context) => EstadoPago(),
        LicenciaDetailPlanPagoViewRoute : (context) => EstadoPlanPago(),

        NoPermitidoViewRoute : (context) => NoPermitido(),
        CargarDocLicenciasViewRoute : (context) => CargarDocLicencias(),

        BeneficiosViewRoute : (context) => Beneficios(),



      };
    }*/
/*
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print(
          "Desde routes settings.arguments : " + settings.arguments.toString());
    }
    final RouteArguments args = settings.arguments as RouteArguments;
    if (kDebugMode) {
      print("Desde routes args.arguments : " + args.arguments.toString());
    }

      switch (settings.name) {
      case AppRoutes.DetalleMensajeViewRoute:
        return buildRoute(args.context, DetalleMensaje(), args, routeType: args.routeType);

      case AppRoutes.CreditoDetailViewRoute:
        return buildRoute(args.context, CreditoDetalle(), args, routeType: args.routeType);

      case AppRoutes.LicenciaDetailViewRoute:
        return buildRoute(args.context, LicenciaDetalle(), args, routeType: args.routeType);

      case AppRoutes.DatosPersonalesViewRoute:
        return buildRoute(args.context, DatosPersonales(), args, routeType: args.routeType);

      case AppRoutes.MisDatosViewRoute:
        return buildRoute(args.context, MisDatos(), args, routeType: args.routeType);

      case AppRoutes.MiCuentaBancariaViewRoute:
        return buildRoute(args.context, MiCuentaBancaria(), args, routeType: args.routeType);

      case AppRoutes.ContactoViewRoute:
        return buildRoute(args.context, Contacto(), args, routeType: args.routeType);

      case AppRoutes.HomeViewRoute:
        return buildRoute(args.context, HomePage(), args, routeType: args.routeType);

      case AppRoutes.LoginViewRoute:
        return buildRoute(args.context, Login(), args, routeType: args.routeType);

      case AppRoutes.LicenciasViewRoute:
        return buildRoute(args.context, Licencias(), args, routeType: args.routeType);

      case AppRoutes.CreditosViewRoute:
        return buildRoute(args.context, Creditos(), args, routeType: args.routeType);

      case AppRoutes.CreditosMenuViewRoute:
        return buildRoute(args.context, CreditosMenu(), args, routeType: args.routeType);

      case AppRoutes.SucursalesViewRoute:
        return buildRoute(args.context, SucursalesMap(), args, routeType: args.routeType);

      case AppRoutes.SimuladorCreditoViewRoute:
        return buildRoute(args.context, Simulador(), args, routeType: args.routeType);

      case AppRoutes.SimuladorCreditoDetalleViewRoute:
        return buildRoute(args.context, SimuladorDetalle(), args, routeType: args.routeType);

      /*case AppRoutes.TestViewRoute:
        return buildRoute(args.context, AnimatedListSample(), args, routeType: args.routeType);*/

      case AppRoutes.BandejaMensajesViewRoute:
        return buildRoute(args.context, BandejaMensajes(), args, routeType: args.routeType);

      case AppRoutes.Puntos18ViewRoute:
        return buildRoute(args.context, Puntos18Detalle(), args, routeType: args.routeType);

      case AppRoutes.DevolucionesViewRoute:
        return buildRoute(args.context, Devoluciones(), args, routeType: args.routeType);

      case AppRoutes.LoginRegisteredViewRoute:
        return buildRoute(args.context, LoginRegistered(), args, routeType: args.routeType);

      case AppRoutes.LeasingViewRoute:
        return buildRoute(args.context, Leasing(), args, routeType: args.routeType);

      case AppRoutes.LeasingDetailViewRoute:
        return buildRoute(args.context, LeasingDetalle(), args, routeType: args.routeType);

      case AppRoutes.LicenciaListadoPagosViewRoute:
        return buildRoute(args.context, PagosListado(), args, routeType: args.routeType);

      case AppRoutes.LicenciaDetailPagosViewRoute:
        return buildRoute(args.context, EstadoPago(), args, routeType: args.routeType);

      case AppRoutes.LicenciaDetailPlanPagoViewRoute:
        return buildRoute(args.context, EstadoPlanPago(), args, routeType: args.routeType);

      case AppRoutes.NoPermitidoViewRoute:
        return buildRoute(args.context, NoPermitido(), args, routeType: args.routeType);

      case AppRoutes.CargarDocLicenciasViewRoute:
        return buildRoute(args.context, CargarDocLicencias(), args, routeType: args.routeType);


      case AppRoutes.BeneficiosViewRoute:
        return buildRoute(args.context, Beneficios(), args, routeType: args.routeType);


      default:
        return buildRoute(
            args.context,
            UndefinedView(
              name: settings.name,
            ),
            args,
            routeType: args.routeType);
    }
  }
  */


