% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/npn_data_download.R
\name{npn_download_individual_phenometrics}
\alias{npn_download_individual_phenometrics}
\title{Download Individual Phenometrics}
\usage{
npn_download_individual_phenometrics(request_source, years, coords = NULL,
  individual_ids = NULL, species_ids = NULL, station_ids = NULL,
  species_types = NULL, network_ids = NULL, states = NULL,
  phenophase_ids = NULL, functional_types = NULL,
  additional_fields = NULL, climate_data = FALSE, ip_address = NULL,
  email = NULL, download_path = NULL, six_layer = FALSE,
  agdd_layer = NULL, six_sub_model = NULL, six_phenophase = NULL,
  additional_layers = NULL)
}
\arguments{
\item{request_source}{Required field, string. Self-identify who is making requests to the data service}

\item{years}{Required field, list of strings. Specify the years to include in the search, e.g. c('2013','2014'). You must specify at least one year.}

\item{coords}{List of float values, used to specify a bounding box as a search parameter, e.g. c ( lower_left_lat, lower_left_long,upper_right,lat,upper_right_long )}

\item{species_ids}{List of unique IDs for searching based on species, e.g. c ( 3, 34, 35 )}

\item{station_ids}{List of unique IDs for searching based on site location, e.g. c ( 5, 9, ... )}

\item{species_types}{List of unique species type names for searching based on species types, e.g. c ( "Decidious", "Evergreen" )}

\item{network_ids}{List of unique IDs for searching based on parter group/network, e.g. ( 500, 300, ... )}

\item{states}{List of US postal states to be used as search params, e.g. c ( "AZ", "IL" )}

\item{phenophase_ids}{List of unique IDs for searching based on phenophase, e.g. c ( 323, 324, ... )}

\item{functional_types}{List of unique functional type names, e.g. c ( "Birds"  )}

\item{additional_fields}{List of additional fields to be included in the search results, e.g. ( "Station_Name", "Plant_Nickname" )}

\item{climate_data}{Boolean value indicating that all climate variables should be included in additional_fields}

\item{ip_address}{Optional field, string. IP Address of user requesting data. Used for generating data reports}

\item{email}{Optional field, string. Email of user requesting data.}

\item{download_path}{Optional file path to which search results should be re-directed for later use.}
}
\value{
Data table of all status records returned as per the search parameters. Null if output directed to file.
}
\description{
This function allows for a parameterized search of all individual phenometrics records in the USA-NPN database, returning all records as per the search results in a
 data table. Data fetched from NPN services is returned as raw JSON before being channeled into a data table. Optinally results can be directed to an output file in
 which case raw JSON is saved to file; in that case, data is also streamed to file which allows for more easily handling of the data if the search otherwise
 returns more data than can be handled at once in memory.
}
\details{
This data type includes estimates of the dates of phenophase onsets and ends for individual plants and for animal species at a site during a user-defined time
 period. Each row represents a series of consecutive "yes" phenophase status records, beginning with the date of the first "yes" and ending with the date of
 the last "yes", submitted for a given phenophase on a given organism. Note that more than one consecutive series for an organism may be present within a single
 growing season or year.

Most search parameters are optional, however, failing to provide even a single search parameter will return all results in the database. Request_Source
 must be provided. This is a self-identifying string, telling the service who is asking for the data or from where the request is being made. It is recommended
 you provide your name or organization name. If the call to this function is acting as an intermediary for a client, then you may also optionally provide
 a user email and/or IP address for usage data reporting later.

Additional fields provides the ability to specify more, non-critical fields to include in the search results. A complete list of additional fields can be found in
 the NPN service's companion documention
 https://docs.google.com/document/d/1yNjupricKOAXn6tY1sI7-EwkcfwdGUZ7lxYv7fcPjO8/edit#heading=h.7yy4i3278v7u
 Metadata on all fields can be found in the following Excel sheet:
 http://www.usanpn.org/files/metadata/individual_phenometrics_datafield_descriptions.xlsx
}
\examples{
\dontrun{
Download all saguaro data for 2013 and 2014
npn_download_individual_phenometrics(request_source="Your Name or Org Here", years=c('2013','2014'), species_id=c(210),
download_path="saguaro_data_2013_2014.json")
}
}
