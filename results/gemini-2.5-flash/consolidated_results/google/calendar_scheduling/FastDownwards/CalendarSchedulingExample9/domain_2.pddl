(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        time_point - object
        person - object
    )

    (:predicates
        (is_available ?p - person ?t_start - time_point)
        (is_scheduled ?t_start - time_point)
        (first_slot_found)
    )

    (:functions
        (total-cost)
    )

    (:constants
        diane kelly deborah - person
    )

    ;; Actions correspond to scheduling a 30-minute slot starting at Ti. Cost = i.

    (:action schedule_s0
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t0) (is_available kelly t0) (is_available deborah t0))
        :effect (and (is_scheduled t0) (first_slot_found) (increase (total-cost) 0))
    )
    (:action schedule_s1
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t1) (is_available kelly t1) (is_available deborah t1))
        :effect (and (is_scheduled t1) (first_slot_found) (increase (total-cost) 1))
    )
    (:action schedule_s2
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t2) (is_available kelly t2) (is_available deborah t2))
        :effect (and (is_scheduled t2) (first_slot_found) (increase (total-cost) 2))
    )
    (:action schedule_s3
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t3) (is_available kelly t3) (is_available deborah t3))
        :effect (and (is_scheduled t3) (first_slot_found) (increase (total-cost) 3))
    )
    (:action schedule_s4
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t4) (is_available kelly t4) (is_available deborah t4))
        :effect (and (is_scheduled t4) (first_slot_found) (increase (total-cost) 4))
    )
    (:action schedule_s5
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t5) (is_available kelly t5) (is_available deborah t5))
        :effect (and (is_scheduled t5) (first_slot_found) (increase (total-cost) 5))
    )
    (:action schedule_s6
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t6) (is_available kelly t6) (is_available deborah t6))
        :effect (and (is_scheduled t6) (first_slot_found) (increase (total-cost) 6))
    )
    (:action schedule_s7
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t7) (is_available kelly t7) (is_available deborah t7))
        :effect (and (is_scheduled t7) (first_slot_found) (increase (total-cost) 7))
    )
    (:action schedule_s8
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t8) (is_available kelly t8) (is_available deborah t8))
        :effect (and (is_scheduled t8) (first_slot_found) (increase (total-cost) 8))
    )
    (:action schedule_s9
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t9) (is_available kelly t9) (is_available deborah t9))
        :effect (and (is_scheduled t9) (first_slot_found) (increase (total-cost) 9))
    )
    (:action schedule_s10
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t10) (is_available kelly t10) (is_available deborah t10))
        :effect (and (is_scheduled t10) (first_slot_found) (increase (total-cost) 10))
    )
    (:action schedule_s11
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t11) (is_available kelly t11) (is_available deborah t11))
        :effect (and (is_scheduled t11) (first_slot_found) (increase (total-cost) 11))
    )
    (:action schedule_s12
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t12) (is_available kelly t12) (is_available deborah t12))
        :effect (and (is_scheduled t12) (first_slot_found) (increase (total-cost) 12))
    )
    (:action schedule_s13
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t13) (is_available kelly t13) (is_available deborah t13))
        :effect (and (is_scheduled t13) (first_slot_found) (increase (total-cost) 13))
    )
    (:action schedule_s14
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t14) (is_available kelly t14) (is_available deborah t14))
        :effect (and (is_scheduled t14) (first_slot_found) (increase (total-cost) 14))
    )
    (:action schedule_s15
        :parameters ()
        :precondition (and (not (first_slot_found)) (is_available diane t15) (is_available kelly t15) (is_available deborah t15))
        :effect (and (is_scheduled t15) (first_slot_found) (increase (total-cost) 15))
    )
)