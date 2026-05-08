(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :universal-preconditions)
    (:types
        agent city day day_count
    )
    (:predicates
        (next-day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (conference-required ?c - city ?d - day)
        (current-day ?d - day)
        (traveler-at ?a - agent ?c - city)
        ;; Predicates to symbolically count days spent in each city
        (num-dubrovnik-days ?n - day_count)
        (num-berlin-days ?n - day_count)
        (num-munich-days ?n - day_count)
        (next-day-count ?n1 - day_count ?n2 - day_count)
    )

    ;; --- Stay Actions (one per city to avoid conditional effects) ---

    (:action stay-at-dubrovnik
        :parameters (?a - agent ?d - day ?next_d - day
                     ?nd_d - day_count ?next_nd_d - day_count ; Dubrovnik count updates
                     ?nb_d - day_count                            ; Berlin count unchanged
                     ?nm_d - day_count                            ; Munich count unchanged
        )
        :precondition (and
            (current-day ?d)
            (traveler-at ?a dubrovnik)
            (next-day ?d ?next_d)
            (num-dubrovnik-days ?nd_d) (next-day-count ?nd_d ?next_nd_d) ; Precondition for count increment
            (num-berlin-days ?nb_d)
            (num-munich-days ?nm_d)
            ;; Conference constraint: if a conference is required on day ?d, agent must be in the required city dubrovnik
            (forall (?other_c - city) (or (not (conference-required ?other_c ?d)) (= dubrovnik ?other_c)))
        )
        :effect (and
            (not (current-day ?d))
            (current-day ?next_d)
            (not (num-dubrovnik-days ?nd_d)) (num-dubrovnik-days ?next_nd_d)
        )
    )

    (:action stay-at-berlin
        :parameters (?a - agent ?d - day ?next_d - day
                     ?nd_d - day_count                            ; Dubrovnik count unchanged
                     ?nb_d - day_count ?next_nb_d - day_count ; Berlin count updates
                     ?nm_d - day_count                            ; Munich count unchanged
        )
        :precondition (and
            (current-day ?d)
            (traveler-at ?a berlin)
            (next-day ?d ?next_d)
            (num-dubrovnik-days ?nd_d)
            (num-berlin-days ?nb_d) (next-day-count ?nb_d ?next_nb_d)
            (num-munich-days ?nm_d)
            ;; Conference constraint: if a conference is required on day ?d, agent must be in the required city berlin
            (forall (?other_c - city) (or (not (conference-required ?other_c ?d)) (= berlin ?other_c)))
        )
        :effect (and
            (not (current-day ?d))
            (current-day ?next_d)
            (not (num-berlin-days ?nb_d)) (num-berlin-days ?next_nb_d)
        )
    )

    (:action stay-at-munich
        :parameters (?a - agent ?d - day ?next_d - day
                     ?nd_d - day_count                            ; Dubrovnik count unchanged
                     ?nb_d - day_count                            ; Berlin count unchanged
                     ?nm_d - day_count ?next_nm_d - day_count ; Munich count updates
        )
        :precondition (and
            (current-day ?d)
            (traveler-at ?a munich)
            (next-day ?d ?next_d)
            (num-dubrovnik-days ?nd_d)
            (num-berlin-days ?nb_d)
            (num-munich-days ?nm_d) (next-day-count ?nm_d ?next_nm_d)
            ;; Conference constraint: if a conference is required on day ?d, agent must be in the required city munich
            (forall (?other_c - city) (or (not (conference-required ?other_c ?d)) (= munich ?other_c)))
        )
        :effect (and
            (not (current-day ?d))
            (current-day ?next_d)
            (not (num-munich-days ?nm_d)) (num-munich-days ?next_nm_d)
        )
    )

    ;; --- Travel Actions (one per direct flight route to avoid conditional effects) ---
    ;; Routes: Munich <-> Dubrovnik, Berlin <-> Munich

    (:action travel-munich-dubrovnik
        :parameters (?a - agent ?d - day ?next_d - day
                     ?nd_d - day_count ?next_nd_d - day_count ; Dubrovnik count updates (destination)
                     ?nb_d - day_count                            ; Berlin count unchanged
                     ?nm_d - day_count                            ; Munich count unchanged (origin)
        )
        :precondition (and
            (current-day ?d)
            (traveler-at ?a munich)
            (connected munich dubrovnik)
            (next-day ?d ?next_d)
            (num-dubrovnik-days ?nd_d) (next-day-count ?nd_d ?next_nd_d)
            (num-berlin-days ?nb_d)
            (num-munich-days ?nm_d)
            ;; Conference constraint for day ?d: agent must arrive at the required city dubrovnik
            (forall (?other_c - city) (or (not (conference-required ?other_c ?d)) (= dubrovnik ?other_c)))
        )
        :effect (and
            (not (traveler-at ?a munich))
            (traveler-at ?a dubrovnik)
            (not (current-day ?d))
            (current-day ?next_d)
            (not (num-dubrovnik-days ?nd_d)) (num-dubrovnik-days ?next_nd_d)
        )
    )

    (:action travel-dubrovnik-munich
        :parameters (?a - agent ?d - day ?next_d - day
                     ?nd_d - day_count                            ; Dubrovnik count unchanged (origin)
                     ?nb_d - day_count                            ; Berlin count unchanged
                     ?nm_d - day_count ?next_nm_d - day_count ; Munich count updates (destination)
        )
        :precondition (and
            (current-day ?d)
            (traveler-at ?a dubrovnik)
            (connected dubrovnik munich)
            (next-day ?d ?next_d)
            (num-dubrovnik-days ?nd_d)
            (num-berlin-days ?nb_d)
            (num-munich-days ?nm_d) (next-day-count ?nm_d ?next_nm_d)
            ;; Conference constraint for day ?d: agent must arrive at the required city munich
            (forall (?other_c - city) (or (not (conference-required ?other_c ?d)) (= munich ?other_c)))
        )
        :effect (and
            (not (traveler-at ?a dubrovnik))
            (traveler-at ?a munich)
            (not (current-day ?d))
            (current-day ?next_d)
            (not (num-munich-days ?nm_d)) (num-munich-days ?next_nm_d)
        )
    )

    (:action travel-berlin-munich
        :parameters (?a - agent ?d - day ?next_d - day
                     ?nd_d - day_count                            ; Dubrovnik count unchanged
                     ?nb_d - day_count                            ; Berlin count unchanged (origin)
                     ?nm_d - day_count ?next_nm_d - day_count ; Munich count updates (destination)
        )
        :precondition (and
            (current-day ?d)
            (traveler-at ?a berlin)
            (connected berlin munich)
            (next-day ?d ?next_d)
            (num-dubrovnik-days ?nd_d)
            (num-berlin-days ?nb_d)
            (num-munich-days ?nm_d) (next-day-count ?nm_d ?next_nm_d)
            ;; Conference constraint for day ?d: agent must arrive at the required city munich
            (forall (?other_c - city) (or (not (conference-required ?other_c ?d)) (= munich ?other_c)))
        )
        :effect (and
            (not (traveler-at ?a berlin))
            (traveler-at ?a munich)
            (not (current-day ?d))
            (current-day ?next_d)
            (not (num-munich-days ?nm_d)) (num-munich-days ?next_nm_d)
        )
    )

    (:action travel-munich-berlin
        :parameters (?a - agent ?d - day ?next_d - day
                     ?nd_d - day_count                            ; Dubrovnik count unchanged
                     ?nb_d - day_count ?next_nb_d - day_count ; Berlin count updates (destination)
                     ?nm_d - day_count                            ; Munich count unchanged (origin)
        )
        :precondition (and
            (current-day ?d)
            (traveler-at ?a munich)
            (connected munich berlin)
            (next-day ?d ?next_d)
            (num-dubrovnik-days ?nd_d)
            (num-berlin-days ?nb_d) (next-day-count ?nb_d ?next_nb_d)
            (num-munich-days ?nm_d)
            ;; Conference constraint for day ?d: agent must arrive at the required city berlin
            (forall (?other_c - city) (or (not (conference-required ?other_c ?d)) (= berlin ?other_c)))
        )
        :effect (and
            (not (traveler-at ?a munich))
            (traveler-at ?a berlin)
            (not (current-day ?d))
            (current-day ?next_d)
            (not (num-berlin-days ?nb_d)) (num-berlin-days ?next_nb_d)
        )
    )
)