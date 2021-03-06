﻿// --------------------------------------------------------------------------------------------------------------------
// <copyright file="RoomTypeController.cs" company="Data Communication">
//   Hotel Manager
// </copyright>
// <summary>
//   The room type controller.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace HotelManagerLib.Controllers
{
    #region

    using System;
    using System.Collections.Generic;

    using HotelManagerLib.Controllers.Interfaces;
    using HotelManagerLib.Enums;
    using HotelManagerLib.Models.Persistant;
    using HotelManagerLib.Repositories;
    using HotelManagerLib.Repositories.Interfaces;

    #endregion

    /// <summary>
    /// The room type controller.
    /// </summary>
    public class RoomTypeController : IEntityController<RoomType>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="RoomTypeController"/> class.
        /// </summary>
        public RoomTypeController()
        {
            this.Repository = new RoomTypeRepository();
            this.PricingListRepository = new PricingListRepository();
        }

        /// <summary>
        /// Gets or sets the repository.
        /// </summary>
        public IEntityRepository<RoomType> Repository { get; set; }

        /// <summary>
        /// Gets or sets the pricing list repository.
        /// </summary>
        public IEntityRepository<PricingList> PricingListRepository { get; set; }

        /// <summary>
        /// The create or update entity.
        /// </summary>
        /// <param name="entity">
        /// The entity.
        /// </param>
        /// <returns>
        /// The <see cref="RoomType"/>.
        /// </returns>
        public RoomType CreateOrUpdateEntity(RoomType entity)
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
        /// <exception cref="ArgumentNullException">
        /// The RoomType is null
        /// </exception>
        public void DeleteEntity(RoomType entity)
        {
            if (entity.Id > 0)
            {
                this.Repository.Delete(entity.Id);
                var pricingLists = this.PricingListRepository.ReadAllList();
                foreach (var pricingList in pricingLists)
                {
                    if ((pricingList.TypeOfBillableEntity == TypeOfBillableEntity.RoomType)
                        && (pricingList.BillableEntityId == entity.Id))
                    {
                        this.PricingListRepository.Delete(pricingList.Id);
                    }
                }
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
        /// The <see cref="RoomType"/>.
        /// </returns>
        public RoomType GetEntity(int id)
        {
            return this.Repository.ReadOne(id);
        }

        /// <summary>
        /// The refresh entities.
        /// </summary>
        /// <returns>
        /// The <see cref="IList{RoomType}"/>.
        /// </returns>
        public IList<RoomType> RefreshEntities()
        {
            return this.Repository.ReadAllList();
        }
    }
}