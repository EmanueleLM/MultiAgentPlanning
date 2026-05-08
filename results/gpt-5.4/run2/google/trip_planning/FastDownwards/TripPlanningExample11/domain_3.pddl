(define (domain tripplanningexample11)
  (:requirements :strips :typing :negative-preconditions)

  (:types city segment)

  (:predicates
    (direct ?from - city ?to - city)
    (next_segment ?s1 - segment ?s2 - segment)
    (current_segment ?s - segment)
    (at ?c - city)
    (assigned ?s - segment ?c - city)
    (conference_segment ?s - segment)
    (final_segment ?s - segment)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_segment s1)
      (not (at vienna))
      (not (at vilnius))
      (not (at valencia))
    )
    :effect (and
      (at ?c)
      (assigned s1 ?c)
    )
  )

  (:action stay_next_segment
    :parameters (?c - city ?froms - segment ?tos - segment)
    :precondition (and
      (current_segment ?froms)
      (next_segment ?froms ?tos)
      (at ?c)
      (assigned ?froms ?c)
    )
    :effect (and
      (not (current_segment ?froms))
      (current_segment ?tos)
      (assigned ?tos ?c)
    )
  )

  (:action fly_next_segment
    :parameters (?fromc - city ?toc - city ?froms - segment ?tos - segment)
    :precondition (and
      (current_segment ?froms)
      (next_segment ?froms ?tos)
      (at ?fromc)
      (assigned ?froms ?fromc)
      (direct ?fromc ?toc)
      (not (at ?toc))
    )
    :effect (and
      (not (current_segment ?froms))
      (current_segment ?tos)
      (not (at ?fromc))
      (at ?toc)
      (assigned ?tos ?toc)
    )
  )
)