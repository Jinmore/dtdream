<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;
use phpCAS;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}


    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置

        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }

        $this->cas_login();
    }

    /**CAS login**/
    protected function cas_login()
	{
		vendor('CAS.CAS');
		phpCAS::setDebug();
		phpCAS::setVerbose(true);
		phpCAS::client(CAS_VERSION_2_0,
			C('CAS.cas_host'),
			C('CAS.cas_port'),
			C('CAS.cas_context')
		);
		// Set no SSL validation for the CAS server.
		phpCAS::setNoCasServerValidation();

		phpCAS::handleLogoutRequests(false);

		$this->assign('user_name', session('user_name'));
	}

	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		is_login() || $this->error('您还没有登录，请先登录！', U('User/login'));
	}

}
