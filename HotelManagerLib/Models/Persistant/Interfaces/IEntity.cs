﻿// --------------------------------------------------------------------------------------------------------------------
// <copyright file="IEntity.cs" company="Data Communication">
//   Hotel Manager
// </copyright>
// <summary>
//   The Entity interface.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace HotelManagerLib.Models.Persistant.Interfaces
{
    /// <summary>
    /// The Entity interface.
    /// </summary>
    public interface IEntity
    {
        /// <summary>
        /// Gets or sets the id.
        /// </summary>
        int Id { get; set; }
    }
}