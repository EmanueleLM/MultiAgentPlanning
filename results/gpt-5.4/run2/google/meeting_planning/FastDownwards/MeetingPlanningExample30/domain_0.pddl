(define (domain meet_stephanie_san_francisco)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    time
    travel_step
    meet_step
  )

  (:constants
    richmond_district north_beach - place
  )

  (:predicates
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)

    (at ?p - place)

    (traveling_rd_to_nb ?s - travel_step)
    (traveling_nb_to_rd ?s - travel_step)
    (next_travel ?s1 - travel_step ?s2 - travel_step)
    (rd_to_nb_step ?s - travel_step)
    (nb_to_rd_step ?s - travel_step)
    (rd_to_nb_first ?s - travel_step)
    (rd_to_nb_last ?s - travel_step)
    (nb_to_rd_first ?s - travel_step)
    (nb_to_rd_last ?s - travel_step)

    (stephanie_available ?t - time)

    (meeting_level ?m - meet_step)
    (next_meeting_level ?m1 - meet_step ?m2 - meet_step)
  )

  (:action wait_at_place
    :parameters (?from_t - time ?to_t - time ?p - place)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (at ?p)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action start_travel_rd_to_nb
    :parameters (?from_t - time ?to_t - time ?s - travel_step)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (at richmond_district)
      (rd_to_nb_step ?s)
      (rd_to_nb_first ?s)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
      (not (at richmond_district))
      (traveling_rd_to_nb ?s)
    )
  )

  (:action continue_travel_rd_to_nb
    :parameters (?from_t - time ?to_t - time ?s1 - travel_step ?s2 - travel_step)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (traveling_rd_to_nb ?s1)
      (rd_to_nb_step ?s1)
      (rd_to_nb_step ?s2)
      (next_travel ?s1 ?s2)
      (not (rd_to_nb_last ?s1))
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
      (not (traveling_rd_to_nb ?s1))
      (traveling_rd_to_nb ?s2)
    )
  )

  (:action finish_travel_rd_to_nb
    :parameters (?from_t - time ?to_t - time ?s - travel_step)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (traveling_rd_to_nb ?s)
      (rd_to_nb_step ?s)
      (rd_to_nb_last ?s)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
      (not (traveling_rd_to_nb ?s))
      (at north_beach)
    )
  )

  (:action start_travel_nb_to_rd
    :parameters (?from_t - time ?to_t - time ?s - travel_step)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (at north_beach)
      (nb_to_rd_step ?s)
      (nb_to_rd_first ?s)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
      (not (at north_beach))
      (traveling_nb_to_rd ?s)
    )
  )

  (:action continue_travel_nb_to_rd
    :parameters (?from_t - time ?to_t - time ?s1 - travel_step ?s2 - travel_step)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (traveling_nb_to_rd ?s1)
      (nb_to_rd_step ?s1)
      (nb_to_rd_step ?s2)
      (next_travel ?s1 ?s2)
      (not (nb_to_rd_last ?s1))
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
      (not (traveling_nb_to_rd ?s1))
      (traveling_nb_to_rd ?s2)
    )
  )

  (:action finish_travel_nb_to_rd
    :parameters (?from_t - time ?to_t - time ?s - travel_step)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (traveling_nb_to_rd ?s)
      (nb_to_rd_step ?s)
      (nb_to_rd_last ?s)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
      (not (traveling_nb_to_rd ?s))
      (at richmond_district)
    )
  )

  (:action meet_stephanie_minute
    :parameters (?from_t - time ?to_t - time ?m1 - meet_step ?m2 - meet_step)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (at north_beach)
      (stephanie_available ?from_t)
      (meeting_level ?m1)
      (next_meeting_level ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
      (not (meeting_level ?m1))
      (meeting_level ?m2)
    )
  )
)