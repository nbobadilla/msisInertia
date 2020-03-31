<template>
<div id="q-app">
    <q-layout view="hHh lpR fFf">
    
        <q-header class="row no-wrap">
        <q-toolbar class="col-2 bg-blue">
            <q-toolbar-title class="text-center text-italic">
            <a href="index.cfm">msis</a>
            </q-toolbar-title>
        </q-toolbar>
        
        <q-tabs
            v-model="tab"
            
            class="col bg-white text-black"
            active-color="blue"
            indicator-color="transparent"
            align="left"
            inline-label
            onClick="topFunction()"
        >
            <q-tab name="Dashboard" label="Dashboard" icon="dashboard"></q-tab>
            <q-tab name="Student" label="Student" icon="person"></q-tab>
            <q-tab name="Mass" label="Mass" icon="group"></q-tab>
            <q-tab name="Reports" label="Reports" icon="show_chart"></q-tab>
            
            <!--- <q-tab name="MEP" label="MEP" icon="language"></q-tab> --->
            <q-tab name="Health" icon="local_hospital" label="Health"  class="" ></q-tab>
            
            <q-tab name="PASS" icon="local_parking" label="PASS"  class=""></q-tab>
        </q-tabs>
        <q-toolbar class="col-1 bg-white text-black">
            <q-space></q-space>
            <q-btn flat round icon="link" @click="right = !right">
                <q-tooltip content-style="font-size: 16px">
                    Quick Links Menu
                </q-tooltip>
            </q-btn>
            <q-btn flat round icon="keyboard_return">
                <q-tooltip content-style="font-size: 16px">
                    Log Out and return to MSDRS Homepage
                </q-tooltip>
            </q-btn>
        </q-toolbar>
        </q-header>
        <q-drawer v-model="left" side="left" overlay behavior="mobile" class="text-white" content-class="bg-grey-10 text-white">
        <!-- drawer content -->
        <q-toolbar>
            <q-toolbar-title>
                Advanced Search
            </q-toolbar-title>
            <q-btn dense flat round @click="left = !left">
                <q-icon name="close" ></q-icon>
            </q-btn>
        </q-toolbar>
        <q-list dark padding>
            <q-item>
                <q-item-section>
                    <q-input standout dark counter label="Student ID" maxlength="8" v-model="studentid" ></q-input>
                </q-item-section>
            </q-item>
            <q-item>
                <q-item-section >
                    <q-input standout dark counter label="COE Number" prefix="WA" suffix="E" v-model="coe" maxlength="6"></q-input>
                </q-item-section>
            </q-item>
            <q-item>
                <q-item-section>
                    <q-input standout dark label="First Name" ></q-input>
                </q-item-section>
            </q-item>
            <q-item>
                <q-item-section>
                    <q-input standout dark label="Last Name" ></q-input>
                </q-item-section>
            </q-item>
            <q-item>
                <q-item-section>
                    <q-input standout dark stack-label label="Birthdate" type="date" ></q-input>
                </q-item-section>
            </q-item>
            
            <q-item>
                <q-item-section >
                    <q-btn label="Search Student" icon="search" color="primary" onclick="location.href='searchResults.html';"></q-btn>
                </q-item-section>
            </q-item>
            
        </q-list>
        </q-drawer>
        <q-drawer v-model="right" side="right" overlay behavior="mobile" content-class="bg-grey-10 text-white">
        <!-- drawer content -->
        <q-toolbar>
            <q-toolbar-title>
                Quick Links
            </q-toolbar-title>
            <q-btn dense flat round >
                <q-icon name="add" />
            </q-btn>
            <q-btn dense flat round @click="right = !right">
                <q-icon name="close" />
            </q-btn>
        </q-toolbar>
        <q-list padding>
            <q-item clickable v-ripple  v-for="n in 10" :key="n">
                <q-item-section>
                    Quick Link {{ n }}
                    <q-item-label caption overline class="text-grey">/folder_name/page_name{{ n }}.cfm</q-item-label>
                </q-item-section>
                <q-item-section avatar>
                    <q-icon name="delete"></q-icon>
                </q-item-section>
            </q-item>
        </q-list>
        
        </q-drawer>
        <q-page-container>
        <q-page>
            <div class="row" style="height:100%;">
                <div class="col-12 col-md-2 bg-blue-7">
                    
                        
                    <q-input dark stretch square standout dense v-model="quickSearchText" input-class="text-left" class="" placeholder="Student Search">
                        <q-tooltip  content-style="font-size: 16px">
                            Enter Student ID or Name
                        </q-tooltip>
                        <template v-slot:append>
                            <q-icon v-if="quickSearchText !== ''" name="clear" class="cursor-pointer" @click="quickSearchText = ''" ></q-icon>
                        </template>
                        <template v-slot:after>
                            <!--- This is Popout version of Advanced Student Search

                                <q-btn round dense flat icon="list" color="white">
                                <q-menu anchor="top right" self="top left" transition-show="jump-right" transition-hide="jump-left" content-class="">
                                    <q-list padding dense>
                                        <q-item-label header class="">Advance Student Search</q-item-label>
                                        <q-item>
                                            <q-item-section>
                                                <q-input label="Student ID"></q-input>
                                            </q-item-section>
                                            <q-item-section >
                                                <q-input label="COE Number" prefix="WA">
                                                </q-input>
                                            </q-item-section>
                                        </q-item>
                                        <q-item>
                                            <q-item-section>
                                                <q-input label="First Name"></q-input>
                                            </q-item-section>
                                            <q-item-section>
                                                <q-input label="Last Name"></q-input>
                                            </q-item-section>
                                        </q-item>
                                        <q-item>
                                            <q-item-section>
                                                <q-input label="Birthdate"></q-input>
                                            </q-item-section>
                                            <q-item-section >
                                                <q-btn label="Search" icon="search" color="primary"></q-btn>
                                            </q-item-section>
                                        </q-item>
                                    </q-list>
                                </q-menu>
                            </q-btn>--->
                            
                            <q-btn stretch dense flat icon="search" color="white" onclick="location.href='searchResults.html';">
                                <q-tooltip content-style="font-size: 16px">
                                    Search Student
                                </q-tooltip>
                            </q-btn>
                            
                            <!-- <q-separator dark vertical></q-separator> -->
                            <q-btn stretch dense flat icon="filter_list" color="white" @click="left = !left">
                                <q-tooltip  content-style="font-size: 16px">
                                    Show Advanced Search Menu
                                </q-tooltip>
                            </q-btn>
                        </template>
                    </q-input>
                        
                        

                    <q-tab-panels v-model="tab" animated class="bg-blue-8 text-white" transition-prev="slide-right" transition-next="slide-left">
                        <q-tab-panel name="Dashboard">
                            <q-list padding dense class="rounded-borders" onclick="location.href='dashboard.html';">
                                <q-item clickable v-close-popup>
                                    <q-item-section>Dashboard</q-item-section>
                                </q-item>
                                <q-item clickable v-close-popup>
                                    <q-item-section>Account Settings</q-item-section>
                                </q-item>
                                <q-item clickable v-close-popup>
                                    <q-item-section>Log Out</q-item-section>
                                </q-item>
                            </q-list>
                        </q-tab-panel>
                        <q-tab-panel name="Student">
                            <!--<q-input dark stretch square standout dense v-model="text" input-class="text-left" class="" placeholder="Student Search">
                                <template v-slot:append>
                                    <q-icon v-if="text === ''" name="search" />
                                    <q-icon v-else name="clear" class="cursor-pointer" @click="text = ''" />
                                </template>
                            </q-input>-->
                            <q-list padding dense class="rounded-borders" @click="left = !left">
                                <q-item-label header class="text-black">Student</q-item-label>
                                <q-list dense class="q-ml-lg">
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Advanced Search</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Search Results</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Student Information</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Student Dashboard</q-item-section>
                                    </q-item>
                                </q-list>
                                <q-item-label header class="text-black">Educational</q-item-label>
                                <q-list dense class="q-ml-lg">
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Assessment</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Secondary</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Supplemental</q-item-section>
                                    </q-item>
                                </q-list>
                            
                                <q-item clickable v-ripple>
                                    <q-item-section>
                                        Eligibility
                                    </q-item-section>
                                </q-item>
                            
                                <q-item clickable v-ripple >
                                    <q-item-section>
                                        Enrollment
                                    </q-item-section>
                                </q-item>
                                <q-item clickable v-ripple >
                                    <q-item-section>
                                        Event
                                    </q-item-section>
                                </q-item>
                            </q-list>
                        </q-tab-panel>
                        <q-tab-panel name="Mass">
                            <q-list padding dense class="rounded-borders" onclick="location.href='massCriteria.html';">
                                <q-item-label header class="text-black">Mass</q-item-label>
                                <q-item-label header class="text-black">Educational</q-item-label>
                                <q-list dense class="q-ml-lg">
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Assessment</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Secondary</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Supplemental</q-item-section>
                                    </q-item>
                                </q-list>
                            
                                <q-item-label header class="text-black">Eligibility</q-item-label>
                                <q-list dense class="q-ml-lg">
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Missed</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Revalidation</q-item-section>
                                    </q-item>
                                </q-list>
                            
                                <q-item clickable v-ripple >
                                    <q-item-section>
                                        Enroll
                                    </q-item-section>
                                </q-item>
                                <q-item clickable v-ripple>
                                    <q-item-section>
                                        Event
                                    </q-item-section>
                                </q-item>
                                <q-item-label header class="text-black">Health</q-item-label>
                                <q-list dense class="q-ml-lg">
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Immunizations</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Physicals</q-item-section>
                                    </q-item>
                                </q-list>
                                <q-item clickable v-ripple>
                                    <q-item-section>
                                        Withdraw
                                    </q-item-section>
                                    
                                </q-item>
                            </q-list>
                        </q-tab-panel>
                        <q-tab-panel name="Reports">
                            <q-list padding dense class="rounded-borders" onclick="location.href='reports.html';">
                                <q-item-label header class="text-black">Reports</q-item-label>
                                <q-item-label header class="text-black">Educational</q-item-label>
                                <q-list dense class="q-ml-lg">
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Assessment</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Secondary</q-item-section>
                                    </q-item>
                                    <q-item clickable v-close-popup>
                                        <q-item-section>Supplemental</q-item-section>
                                    </q-item>
                                </q-list>
                            
                                <q-item clickable v-ripple>
                                    <q-item-section>
                                        Eligibility
                                    </q-item-section>
                                </q-item>
                            
                                <q-item clickable v-ripple >
                                    <q-item-section>
                                        Enrollment
                                    </q-item-section>
                                </q-item>
                                <q-item clickable v-ripple >
                                    <q-item-section>
                                        Event
                                    </q-item-section>
                                </q-item>
                            </q-list>
                        </q-tab-panel>
                        
                        <q-tab-panel name="MEP" class="">
                            <q-list padding dense class="rounded-borders">
                                <q-item-label header class="text-black">MEP</q-item-label>
                                <q-item clickable v-close-popup>
                                    <q-item-section>ESD Reporting Tool</q-item-section>
                                </q-item>
                                <q-item clickable v-close-popup>
                                    <q-item-section>FER Scheduler</q-item-section>
                                </q-item>
                                <q-item clickable v-close-popup>
                                    <q-item-section>Student Events</q-item-section>
                                </q-item>
                            </q-list>
                        </q-tab-panel>
                        <q-tab-panel name="Health" class="bg-teal-5">

                        </q-tab-panel>
                        <q-tab-panel name="PASS" class="bg-light-blue">

                        </q-tab-panel>
                    </q-tab-panels>
                    
                    
                </div>
            
                <div class="col-12 col-md-10 bg-grey-3">
                    
                        
                    <!--These are the Breadcrumbs, need to decide where to put these.
                        
                        <q-breadcrumbs class="q-mb-lg">
                        <template v-slot:separator>
                            <q-icon
                            size="1.5em"
                            name="chevron_right"
                            color="black"
                            ></q-icon>
                        </template>
                        <q-breadcrumbs-el label="MSIS" class="text-grey-7"></q-breadcrumbs-el>
                        <q-breadcrumbs-el label="Dashboard" icon="dashboard"></q-breadcrumbs-el>
                    </q-breadcrumbs>-->
                    

                    <slot></slot>

                    <q-page-sticky position="bottom-right" :offset="[18, 18]" id="scrollBtn">
                        <q-btn fab icon="keyboard_arrow_up" color="blue" onClick="topFunction()">
                            <q-tooltip content-style="font-size: 16px">
                                Scroll to Top
                            </q-tooltip>
                        </q-btn>
                    </q-page-sticky>

                </div>
            
            </div>
        </q-page>
    </q-page-container>
    
    </q-layout>
</div>
</template>



<script>

export default {
    data: function () {
        return {
            tab: 'dashboard',
            left: false,
            studentid: '',
            coe: '',
            right: false,
            left: false,
            quickSearchText: ''
        }
     }
    
}

</script>
