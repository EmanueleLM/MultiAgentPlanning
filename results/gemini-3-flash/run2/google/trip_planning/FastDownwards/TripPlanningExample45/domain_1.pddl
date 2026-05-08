(define (domain trip_planning_example_45)
    (:requirements :strips :typing)
    (:types city day count)
    (:predicates
        (at ?c - city ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (next_count ?n1 - count ?n2 - count)
        (count_copenhagen ?n - count)
        (count_lisbon ?n - count)
        (count_florence ?n - count)
        (visited_at ?c - city ?d - day)
        (can_fly ?c1 - city ?c2 - city)
    )

    ;; Stay at Copenhagen for one day
    (:action stay_copenhagen
        :parameters (?d - day ?nd - day ?c1 - count ?c2 - count)
        :precondition (and (at copenhagen ?d) (next_day ?d ?nd) (count_copenhagen ?c1) (next_count ?c1 ?c2))
        :effect (and (not (at copenhagen ?d)) (at copenhagen ?nd) (not (count_copenhagen ?c1)) (count_copenhagen ?c2) (visited_at copenhagen ?d))
    )

    ;; Stay at Lisbon for one day
    (:action stay_lisbon
        :parameters (?d - day ?nd - day ?c1 - count ?c2 - count)
        :precondition (and (at lisbon ?d) (next_day ?d ?nd) (count_lisbon ?c1) (next_count ?c1 ?c2))
        :effect (and (not (at lisbon ?d)) (at lisbon ?nd) (not (count_lisbon ?c1)) (count_lisbon ?c2) (visited_at lisbon ?d))
    )

    ;; Stay at Florence for one day
    (:action stay_florence
        :parameters (?d - day ?nd - day ?c1 - count ?c2 - count)
        :precondition (and (at florence ?d) (next_day ?d ?nd) (count_florence ?c1) (next_count ?c1 ?c2))
        :effect (and (not (at florence ?d)) (at florence ?nd) (not (count_florence ?c1)) (count_florence ?c2) (visited_at florence ?d))
    )

    ;; Fly from Copenhagen to Lisbon (counts as a day in Copenhagen)
    (:action fly_copenhagen_lisbon
        :parameters (?d - day ?nd - day ?c1 - count ?c2 - count)
        :precondition (and (at copenhagen ?d) (next_day ?d ?nd) (count_copenhagen ?c1) (next_count ?c1 ?c2) (can_fly copenhagen lisbon))
        :effect (and (not (at copenhagen ?d)) (at lisbon ?nd) (not (count_copenhagen ?c1)) (count_copenhagen ?c2) (visited_at copenhagen ?d))
    )

    ;; Fly from Lisbon to Copenhagen (counts as a day in Lisbon)
    (:action fly_lisbon_copenhagen
        :parameters (?d - day ?nd - day ?c1 - count ?c2 - count)
        :precondition (and (at lisbon ?d) (next_day ?d ?nd) (count_lisbon ?c1) (next_count ?c1 ?c2) (can_fly lisbon copenhagen))
        :effect (and (not (at lisbon ?d)) (at copenhagen ?nd) (not (count_lisbon ?c1)) (count_lisbon ?c2) (visited_at lisbon ?d))
    )

    ;; Fly from Lisbon to Florence (counts as a day in Lisbon)
    (:action fly_lisbon_florence
        :parameters (?d - day ?nd - day ?c1 - count ?c2 - count)
        :precondition (and (at lisbon ?d) (next_day ?d ?nd) (count_lisbon ?c1) (next_count ?c1 ?c2) (can_fly lisbon florence))
        :effect (and (not (at lisbon ?d)) (at florence ?nd) (not (count_lisbon ?c1)) (count_lisbon ?c2) (visited_at lisbon ?d))
    )

    ;; Fly from Florence to Lisbon (counts as a day in Florence)
    (:action fly_florence_lisbon
        :parameters (?d - day ?nd - day ?c1 - count ?c2 - count)
        :precondition (and (at florence ?d) (next_day ?d ?nd) (count_florence ?c1) (next_count ?c1 ?c2) (can_fly florence lisbon))
        :effect (and (not (at florence ?d)) (at lisbon ?nd) (not (count_florence ?c1)) (count_florence ?c2) (visited_at florence ?d))
    )
)