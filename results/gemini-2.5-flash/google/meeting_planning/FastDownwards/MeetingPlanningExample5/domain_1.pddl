(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        person
    )
    (:predicates
        (at ?l - location)
        (has-met ?p - person) ; Indicates William has been met (meeting completed)
        (meeting-in-progress ?p - person) ; Indicates a meeting is currently ongoing
    )
    (:functions
        (current-time)
        (travel-duration ?from ?to - location)
        (meeting-start-time) ; Time when the meeting with William started
        (total-meeting-duration) ; Total duration of the meeting with William
        (total-cost) ; For optimization (minimizing total-cost)
    )

    ;; Action: move
    ;; Moves the agent from one location to another, updating current-time.
    (
        :action move
        :parameters (?from ?to - location)
        :precondition (and
            (at ?from)
            (not (at ?to))
            (not (meeting-in-progress william)) ; Cannot move while meeting William
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (increase (current-time) (travel-duration ?from ?to))
        )
    )

    ;; Action: start-meeting-william
    ;; Initiates a meeting with William at The Castro, provided William is available.
    (
        :action start-meeting-william
        :parameters ()
        :precondition (and
            (at the-castro)
            (not (meeting-in-progress william))
            (not (has-met william)) ; Only one meeting with William is intended by the problem
            (>= (current-time) 735) ; William available from 12:15 PM (735 minutes from midnight)
            (< (current-time) 1320) ; William available until 10:00 PM (1320 minutes), meeting cannot start exactly at 10 PM
        )
        :effect (and
            (meeting-in-progress william)
            (assign (meeting-start-time) (current-time))
        )
    )

    ;; Action: continue-meeting-william
    ;; Advances time by one minute during an ongoing meeting.
    ;; This allows for variable duration meetings by chaining this action.
    (
        :action continue-meeting-william
        :parameters ()
        :precondition (and
            (meeting-in-progress william)
            (at the-castro)
            (< (current-time) 1320) ; Meeting cannot continue past 10:00 PM
        )
        :effect (and
            (increase (current-time) 1)
        )
    )

    ;; Action: end-meeting-william
    ;; Concludes the meeting with William, calculates its total duration,
    ;; and updates the optimization metric.
    (
        :action end-meeting-william
        :parameters ()
        :precondition (and
            (meeting-in-progress william)
            (at the-castro)
            ;; Ensure meeting lasted at least 1 minute to avoid zero-duration meetings
            (>= (current-time) (+ (meeting-start-time) 1))
        )
        :effect (and
            (not (meeting-in-progress william))
            (has-met william)
            ;; Calculate the actual meeting duration
            (assign (total-meeting-duration) (- (current-time) (meeting-start-time)))
            ;; To maximize total-meeting-duration, we minimize its negative value.
            (increase (total-cost) (- (total-meeting-duration)))
        )
    )
)