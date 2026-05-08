(define (domain trip-planning-11)
(:requirements :strips :typing :negative-preconditions)
(:types
    city
    day_stage ; Start, D1, D2, ..., D15
    duration ; N0, N1, ..., N15
)

(:constants
    VNN - city ; Vienna
    VLS - city ; Vilnius
    VLC - city ; Valencia
    Start D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 D15 - day_stage
    N0 N1 N2 N3 N4 N5 N6 N7 N8 N9 N10 N11 N12 N13 N14 N15 - duration
)

(:predicates
    (connected ?c1 - city ?c2 - city)
    (is_successor ?s1 - day_stage ?s2 - day_stage)
    (next_duration ?n1 - duration ?n2 - duration)

    (current_stage ?s - day_stage)
    (at ?c - city) ; Location at the end of the current day
    
    ; Hard temporal constraints
    (requires_VLC ?d - day_stage)

    ; Duration counters (must reach required counts)
    (VNN_count ?n - duration)
    (VLS_count ?n - duration)
    (VLC_count ?n - duration)
)

; --- Utility Actions for Initializing Day 1 ---

(:action transition_to_d1_VNN
    :parameters (?n0 - duration ?n1 - duration)
    :precondition (and (current_stage Start) (next_duration ?n0 ?n1)
                       (VNN_count ?n0) (VLS_count N0) (VLC_count N0))
    :effect (and (not (current_stage Start)) (current_stage D1)
                 (at VNN) (not (VNN_count ?n0)) (VNN_count ?n1))
)

(:action transition_to_d1_VLS
    :parameters (?n0 - duration ?n1 - duration)
    :precondition (and (current_stage Start) (next_duration ?n0 ?n1)
                       (VNN_count N0) (VLS_count ?n0) (VLC_count N0))
    :effect (and (not (current_stage Start)) (current_stage D1)
                 (at VLS) (not (VLS_count ?n0)) (VLS_count ?n1))
)

(:action transition_to_d1_VLC
    :parameters (?n0 - duration ?n1 - duration)
    :precondition (and (current_stage Start) (next_duration ?n0 ?n1)
                       (VNN_count N0) (VLS_count N0) (VLC_count ?n0)
                       (not (requires_VLC D1))
                       )
    :effect (and (not (current_stage Start)) (current_stage D1)
                 (at VLC) (not (VLC_count ?n0)) (VLC_count ?n1))
)


; --- Stay Actions (D_i -> D_{i+1}) ---

(:action stay_VNN
    :parameters (?d_curr - day_stage ?d_next - day_stage ?n_curr - duration ?n_next - duration)
    :precondition (and (current_stage ?d_curr) (is_successor ?d_curr ?d_next)
                       (at VNN) (not (requires_VLC ?d_next))
                       (VNN_count ?n_curr) (next_duration ?n_curr ?n_next))
    :effect (and (not (current_stage ?d_curr)) (current_stage ?d_next)
                 (not (VNN_count ?n_curr)) (VNN_count ?n_next))
)

(:action stay_VLS
    :parameters (?d_curr - day_stage ?d_next - day_stage ?n_curr - duration ?n_next - duration)
    :precondition (and (current_stage ?d_curr) (is_successor ?d_curr ?d_next)
                       (at VLS) (not (requires_VLC ?d_next))
                       (VLS_count ?n_curr) (next_duration ?n_curr ?n_next))
    :effect (and (not (current_stage ?d_curr)) (current_stage ?d_next)
                 (not (VLS_count ?n_curr)) (VLS_count ?n_next))
)

(:action stay_VLC
    :parameters (?d_curr - day_stage ?d_next - day_stage ?n_curr - duration ?n_next - duration)
    :precondition (and (current_stage ?d_curr) (is_successor ?d_curr ?d_next)
                       (at VLC) (VLC_count ?n_curr) (next_duration ?n_curr ?n_next))
    :effect (and (not (current_stage ?d_curr)) (current_stage ?d_next)
                 (not (VLC_count ?n_curr)) (VLC_count ?n_next))
)

; --- Travel Actions (D_i -> D_{i+1}) ---

; VNN -> VLS
(:action travel_VNN_VLS
    :parameters (?d_curr - day_stage ?d_next - day_stage ?n_curr - duration ?n_next - duration)
    :precondition (and (current_stage ?d_curr) (is_successor ?d_curr ?d_next)
                       (at VNN) (connected VNN VLS)
                       (not (requires_VLC ?d_next))
                       (VLS_count ?n_curr) (next_duration ?n_curr ?n_next))
    :effect (and (not (current_stage ?d_curr)) (current_stage ?d_next)
                 (not (at VNN)) (at VLS)
                 (not (VLS_count ?n_curr)) (VLS_count ?n_next))
)

; VNN -> VLC
(:action travel_VNN_VLC
    :parameters (?d_curr - day_stage ?d_next - day_stage ?n_curr - duration ?n_next - duration)
    :precondition (and (current_stage ?d_curr) (is_successor ?d_curr ?d_next)
                       (at VNN) (connected VNN VLC)
                       (VLC_count ?n_curr) (next_duration ?n_curr ?n_next))
    :effect (and (not (current_stage ?d_curr)) (current_stage ?d_next)
                 (not (at VNN)) (at VLC)
                 (not (VLC_count ?n_curr)) (VLC_count ?n_next))
)

; VLS -> VNN
(:action travel_VLS_VNN
    :parameters (?d_curr - day_stage ?d_next - day_stage ?n_curr - duration ?n_next - duration)
    :precondition (and (current_stage ?d_curr) (is_successor ?d_curr ?d_next)
                       (at VLS) (connected VLS VNN)
                       (not (requires_VLC ?d_next))
                       (VNN_count ?n_curr) (next_duration ?n_curr ?n_next))
    :effect (and (not (current_stage ?d_curr)) (current_stage ?d_next)
                 (not (at VLS)) (at VNN)
                 (not (VNN_count ?n_curr)) (VNN_count ?n_next))
)

; VLC -> VNN
(:action travel_VLC_VNN
    :parameters (?d_curr - day_stage ?d_next - day_stage ?n_curr - duration ?n_next - duration)
    :precondition (and (current_stage ?d_curr) (is_successor ?d_curr ?d_next)
                       (at VLC) (connected VLC VNN)
                       (not (requires_VLC ?d_next))
                       (VNN_count ?n_curr) (next_duration ?n_curr ?n_next))
    :effect (and (not (current_stage ?d_curr)) (current_stage ?d_next)
                 (not (at VLC)) (at VNN)
                 (not (VNN_count ?n_curr)) (VNN_count ?n_next))
)
)