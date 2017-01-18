﻿// --------------------------------------------------------------------------------------------------------------------
// <copyright file="BookingController.cs" company="">
//   
// </copyright>
// <summary>
//   The booking controller.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace HotelManagerLib.Controllers
{
    #region

    using System;
    using System.Collections.Generic;
    using System.Linq;

    using HotelManagerLib.Controllers.Interfaces;
    using HotelManagerLib.DBContext;
    using HotelManagerLib.Enums;
    using HotelManagerLib.Models.Persistant;
    using HotelManagerLib.Repositories.Interfaces;

    #endregion

    /// <summary>
    /// The booking controller.
    /// </summary>
    public class BookingController : IEntityController<Booking>
    {
        

        /// <summary>
        /// Gets or sets the repository.
        /// </summary>
        public IEntityRepository<Booking> Repository { get; set; }

        /// <summary>
        /// The create or update entity.
        /// </summary>
        /// <param name="entity">
        /// The entity.
        /// </param>
        /// <returns>
        /// The <see cref="Booking"/>.
        /// </returns>
        /// <exception cref="NotImplementedException">
        /// </exception>
        public Booking CreateOrUpdateEntity(Booking entity)
        {
            if (entity.Id == 0)
            {
                entity = this.Repository.Create(entity);
            }
            else
            {
                this.Repository.Update(entity);
            }

            return entity;
        }

        /// <summary>
        /// The delete entity.
        /// </summary>
        /// <param name="entity">
        /// The entity.
        /// </param>
        /// <exception cref="NotImplementedException">
        /// </exception>
        public void DeleteEntity(Booking entity)
        {
            if (entity.Id > 0)
            {
                this.Repository.Delete(entity.Id);
            }
            else
            {
                throw new ArgumentNullException();
            }
        }

        /// <summary>
        /// The get entity.
        /// </summary>
        /// <param name="id">
        /// The id.
        /// </param>
        /// <returns>
        /// The <see cref="Booking"/>.
        /// </returns>
        /// <exception cref="NotImplementedException">
        /// </exception>
        public Booking GetEntity(int id)
        {
            if (id > 0)
            {
                return this.Repository.ReadOne(id);
            }
            else
            {
                throw new ArgumentNullException();
            }
        }

        /// <summary>
        /// The refresh entities.
        /// </summary>
        /// <returns>
        /// The <see cref="IList"/>.
        /// </returns>
        /// <exception cref="NotImplementedException">
        /// </exception>
        public IList<Booking> RefreshEntities()
        {
            var bookingList = this.Repository.ReadAllList();
            return bookingList;
        }

        /// <summary>
        /// The is room available.
        /// </summary>
        /// <param name="room">
        /// The room.
        /// </param>
        /// <param name="bookings">
        /// The bookings.
        /// </param>
        /// <param name="dateFrom">
        /// The date from.
        /// </param>
        /// <param name="dateTo">
        /// The date to.
        /// </param>
        /// <returns>
        /// The <see cref="bool"/>.
        /// </returns>
        public bool IsRoomAvailable(Room room, IList<Booking> bookedRoomsList)
        {
            var isAvailable = false;
            foreach (var booking in bookedRoomsList)
            {
                if (booking.Room.Id == room.Id && booking.Status != Status.Cancelled)
                {
                    isAvailable = false;
                }
                else
                {
                    isAvailable = true;
                }
            }
            return isAvailable;

        }
    }
}