using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_1.Controllers
{
    public class LoginController : Controller
    {
        private DB_Trabajo_1Entities3 db = new DB_Trabajo_1Entities3();


        //
        // GET: /Login/
        public ActionResult Index()
        {
            return View();
        }

        public void ValidaLogeo()
        {
            //UsuarioController objUsuarioController = null;
            List<tTR_Usuarios> loenUsuario = null;
            tTR_Usuarios objUsuarios = null;
            int iEstado = 0;
            try
            {
                loenUsuario = new List<tTR_Usuarios>();
               
                //IQueryable Personas;
                loenUsuario = db.tTR_Usuarios.Cast<tTR_Usuarios>().ToList();
                var sUser = Request.Form["txtUsuario"];
                var sPassword= Request.Form["txtPassword"];

                loenUsuario = loenUsuario.Where(x => x.vNombreUsuario == sUser && x.vPassword == sPassword && x.iEstado == 1).ToList();

                if (loenUsuario.Count == 1)
                {
                    foreach (var item in loenUsuario)
                    {
                        objUsuarios = new tTR_Usuarios();
                        objUsuarios.vNombre = item.vNombre;
                        objUsuarios.vApellidos = item.vApellidos;
                        objUsuarios.vNombreUsuario = item.vNombreUsuario;
                        objUsuarios.iIdRol = item.iIdRol;
                        objUsuarios.iEstado = item.iEstado;
                    }
                    iEstado = 1;
                    Session["LogeoUsuario"] = objUsuarios;
                    Session["Nombres"] = objUsuarios.vNombre + " " + objUsuarios.vApellidos;
                    Response.Redirect("~/Home/Index");
                    ViewBag.ValidaLogeo = "Validación correcta";
                }
                else
                {
                    Response.Redirect("~/Login/Index");
                    iEstado = 0;
                    ViewBag.ValidaLogeo = "El usuario y/o password son incorrectos, verifique con el administrador si el usuario se encuentra activo";
                }
                //var Query = (from Registro in db.tTR_Usuarios 
                //               where  Registro.vNombreUsuario == sUser.ToString() 
                //                   && Registro.vPassword == sPassword.ToString() 
                //                   && Registro.iEstado == 1
                //                 select Registro);
                //loenUsuario = Query.ToList();
               
              

            }
            catch (Exception ex)
            {
                throw ex;
                iEstado = 0;
                Response.Redirect("~/Login/Index");
               
            }

           
        }

        public ActionResult CerrarSession()
        {
            Session.Clear();
            Session.RemoveAll();
            return View("Index");
        }


        #region Codigo Que no Se Usa 
        //
        // GET: /Login/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Login/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Login/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Login/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Login/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Login/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Login/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        #endregion
    }
}
